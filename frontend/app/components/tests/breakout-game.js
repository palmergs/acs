import Ember from 'ember';

export default Ember.Component.extend({
  tagName: 'canvas',
  attributeBindings: [ 'width', 'height', 'tabindex', 'canvasStyle:style' ],
  width: 800,
  height: 500,
  tabindex: 1,
  canvasStyle: function() {
    return Ember.String.htmlSafe('outline: none');
  }.property(),
  startBallX: Ember.computed('width', function() {
    return this.get('width') / 2;
  }),
  startBallY: Ember.computed('height', function() {
    return this.get('height') - 30;
  }),
  leftPressed: false,
  rightPressed: false,
  brickRows: 3,
  brickColumns: 7,
  brickWidth: 75,
  brickHeight: 20,
  brickPadding: 10,
  brickOffsetTop: 30,
  brickOffsetLeft: 30,

  drawBall(ctx, x, y, r) {
    ctx.beginPath();
    ctx.arc(x, y, r, 0, Math.PI * 2, false);
    ctx.fillStyle = "#0095dd";
    ctx.fill();
    ctx.closePath();
  },

  drawPaddle(ctx, w, h, paddleX, paddleWidth, paddleHeight) {
    ctx.beginPath();
    ctx.rect(paddleX, h - paddleHeight, paddleWidth, paddleHeight);
    ctx.fillStyle = "#0095dd";
    ctx.fill();
    ctx.closePath();
  },

  buildBricks() {
    const bricks = [];
    for(let c = 0; c < this.get('brickColumns'); ++c) {
      bricks[c] = [];
      for(let r = 0; r < this.get('brickRows'); ++r) {
        bricks[c][r] = { x: 0, y: 0, status: 3, max: 3 };
      }
    }
    return bricks;
  },

  drawBricks(ctx, bricks) {
    const w = this.get('width'),
        rows = this.get('brickRows'),
        cols = this.get('brickColumns'),
        bw = this.get('brickWidth'),
        bh = this.get('brickHeight'),
        bp = (w - (cols * bw)) / (cols + 1),
        ot = this.get('brickOffsetTop');
    let b = null;
    for(let c = 0; c < cols; ++c) {
      for(let r = 0; r < rows; ++r) {
        b = bricks[c][r];
        if(b.status > 0) {
          b.x = (c * (bw + bp)) + bp;
          b.y = (r * (bh + bp)) + ot;
          ctx.beginPath();
          ctx.rect(b.x, b.y, bw, bh);
          ctx.fillStyle = `rgba(0, 0, 0, ${ b.status / b.max })`;
          ctx.fill();
          ctx.closePath();
        }
      }
    }
  },

  collisionDetection(bricks, x, y, r) {
    const rows = this.get('brickRows'),
        cols = this.get('brickColumns'),
        bw = this.get('brickWidth'),
        bh = this.get('brickHeight');
    let b = null;
    for(let c = 0; c < cols; ++c) {
      for(let r = 0; r < rows; ++r) {
        b = bricks[c][r];
        if(b.status > 0) {
          if(x > b.x && x < b.x + bw && y > b.y && y < b.y + bh) {
            b.status = b.status - 1;
            return b.max - b.status;
          }
        }
      }
    }
    return -1;
  },

  drawScore(ctx, score, dx, dy, ts) {
    ctx.font = "16px Arial";
    ctx.fillStyle = "#0095DD";
    ctx.fillText(`Score: ${ score } Frame: ${ ts }`, 8, 20);
  },

  keyDown: function(evt) {
    const code = evt.keyCode;
    switch(code) {
      default:
      console.log(code);
    }
    if(evt.keyCode == 39) { this.set('rightPressed', true); }
    else if(evt.keyCode == 37) { this.set('leftPressed', true); }
  },

  keyUp: function(evt) {
    if(evt.keyCode == 39) { this.set('rightPressed', false); }
    else if(evt.keyCode == 37) { this.set('leftPressed', false); }
  },

  didInsertElement() {
    this._super(...arguments);
    const canvas = this.$()[0];
    const ctx = canvas.getContext('2d');
    const w = this.get('width'),
        h = this.get('height'),
        paddleHeight = 10,
        bricks = this.buildBricks();

    let x = this.get('startBallX'),
        y = this.get('startBallY'),
        r = 10,
        dx = 2,
        dy = -2,
        rightPressed = false,
        leftPressed = false,
        paddleWidth = 75,
        paddleX = (w - paddleWidth) / 2,
        score = 0,
        lastTimestamp = 0;

    canvas.focus();
    const draw = (ts) => {
      ctx.clearRect(0, 0, w, h);
      this.drawBricks(ctx, bricks);
      this.drawBall(ctx, x, y, r);
      this.drawPaddle(ctx, w, h, paddleX, paddleWidth, paddleHeight);

      this.drawScore(ctx, score, dx, dy, ts - lastTimestamp);
      lastTimestamp = ts;

      if(x + dx > w - r || x + dx < r) { dx = -dx; }
      if(y + dy < r) {
        dy = -dy;
      } else if(x > paddleX && x < paddleX + paddleWidth && y > h - r - paddleHeight) {
        dy = -dy;
      }  else if(y + dy > h - r) {
        dx = 0;
        dy = 0;
      }

      x = x + dx;
      y = y + dy;
      if(this.get('rightPressed') && paddleX < w - paddleWidth) {
        paddleX += 7;
      } else if(this.get('leftPressed') && paddleX > 0) {
        paddleX -= 7;
      }

      let collision = this.collisionDetection(bricks, x, y, r);
      if(collision !== -1) {
        score += collision;
        dy = -dy;
        dy = dy * (1.0 + (Math.random() / 4.0 - Math.random() / 5.0));
        dx = dx * (1.0 + (Math.random() / 4.0 - Math.random() / 5.0));
      }
      requestAnimationFrame(draw);
    };
    draw();
  }
});
