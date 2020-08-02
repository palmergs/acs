class ThingSerializer
  include FastJsonapi::ObjectSerializer
  set_key_transform :dash
  belongs_to :adventure
  attributes :category,
             :name,
             :descr,
             :category,
             :weight,
             :value,
             :droppable,
             :power,
             :attack,
             :breakability,
             :magic,
             :range,
             :max_carry,
             :max_stack,
             :buyable,
             :tile_idx
end
