package repositories;

import java.util.List;

public interface GenericRepository<T> {
    boolean create(T obj);
    T read(int id);
    List<T> readAll();
    boolean update(T obj);
    boolean delete(int id);
}
