abstract class Repository<BaseModel> {
  Future insertItem(BaseModel entry);
  Future<List<BaseModel>> getItems();
  Future updateItem(BaseModel entry);
  Future deleteItem(int id);
}
