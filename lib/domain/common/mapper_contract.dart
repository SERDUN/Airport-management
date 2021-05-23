abstract class Mapper<D, M> {
  M mapToModel(D dto);

  D mapToDto(M model);
}
