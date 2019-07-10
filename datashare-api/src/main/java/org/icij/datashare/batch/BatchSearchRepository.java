package org.icij.datashare.batch;

import org.icij.datashare.text.Document;
import org.icij.datashare.user.User;

import java.sql.SQLException;
import java.util.List;

public interface BatchSearchRepository {
    boolean save(User user, BatchSearch batchSearch) throws SQLException;
    boolean saveResults(String batchSearchId, List<Document> documents) throws SQLException;

    List<BatchSearch> get(User user) throws SQLException;
    List<BatchSearch> get() throws SQLException;
}