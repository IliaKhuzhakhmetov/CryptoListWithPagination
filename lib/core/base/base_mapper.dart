abstract interface class EntityModelMapper<Entity, Model> {
  const EntityModelMapper();
  Entity toEntity(Model model);
  Model fromEntity(Entity model);
}

abstract interface class EntityMapper<Entity, Model> {
  const EntityMapper();
  Entity toEntity(Model map);
}

abstract interface class ModelMapper<Model, Entity> {
  const ModelMapper();
  Entity fromModel(Model model);
}
