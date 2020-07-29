class ThingSerializer
  include FastJsonapi::ObjectSerializer
  belongs_to :adventure
  attributes :name,
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
