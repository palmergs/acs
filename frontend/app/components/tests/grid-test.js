import Ember from 'ember';
import { select, event } from 'd3-selection';

export default Ember.Component.extend({

  width: 480,
  height: 640,
  rows: 64,
  cols: 48,

  gridData() {
    const data = new Array(),
        rows = this.get('rows'),
        cols = this.get('cols'),
        cellWidth = (this.get('width') - 2) / cols,
        cellHeight = (this.get('height') - 2) / rows;
    
    let xpos = 1,
        ypos = 1;

    for(let r = 0; r < rows; ++r) {
      data.push(new Array());
      for(let c = 0; c < cols; ++c) {
        data[r].push({
            x: xpos,
            y: ypos,
            width: cellWidth,
            height: cellHeight,
            clicks: 0
        });
        xpos += cellWidth;
      }
      xpos = 1;
      ypos += cellHeight;
    }

    return data;
  },

  didInsertElement() {
    this._super(...arguments);

    const elem = this.$();

    const grid = select(elem.get(0)).
        append('svg').
        attr('width', `${ this.get('width') }px`).
        attr('height', `${ this.get('height') }px`);

    const data = this.gridData();

    const row = grid.selectAll('.row').
        data(data).
        enter().append('g').
            attr('class', 'row');

    const clickColors = [ '#fff', '#eee', '#ddd', '#ccc', '#bbb', '#aaa', '#999', '#888', '#777', '#666', '#555', '#444', '#333', '#222', '#111', '#000' ];
    row.selectAll('.square').
        data(function(d) { return d; }).
        enter().append('rect').
            attr('class', 'square').
            attr('x', function(d) { return d.x; }).
            attr('y', function(d) { return d.y; }).
            attr('width', function(d) { return d.width; }).
            attr('height', function(d) { return d.height; }).
            style('fill', '#fff').
            style('stroke', '#888').
            on('mouseover', function(d, idx, evt) {
              console.log(d, event);
              if(event.buttons === 1) {
                if(event.shiftKey) {
                  d.clicks = 0;
                  select(this).style('fill', clickColors[d.clicks % clickColors.length]);
                } else {
                  if(d.clicks < clickColors.length - 1) { ++d.clicks; }
                  select(this).style('fill', clickColors[d.clicks % clickColors.length]);
                }
              }
            });
  }
});
