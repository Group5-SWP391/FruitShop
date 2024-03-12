package dal;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import model.SaleData;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

public class SaleDashboardDAO extends MyDAO {

    public LinkedHashMap<String, Integer> getOrderStats(String startDate, String endDate) {
        LinkedHashMap<String, Integer> orderData = new LinkedHashMap<>();

        try {
            con = new DBContext().getConnection();

            String query = "SELECT DATE(Date) AS OrderDate, COUNT(*) AS TotalOrders "
                    + "FROM `order` "
                    + "WHERE Date BETWEEN ? AND ? "
                    + "GROUP BY OrderDate "
                    + "ORDER BY OrderDate;";
            ps = con.prepareStatement(query);
            ps.setString(1, "startDate");
            ps.setString(2, "endDate");
            rs = ps.executeQuery();

            while (rs.next()) {
                String orderDate = rs.getString("OrderDate");
                int totalOrders = rs.getInt("TotalOrders");
                orderData.put(orderDate, totalOrders);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (SQLException se) {
                se.printStackTrace();
            }
        }
        return orderData;
    }

    public LinkedHashMap<String, Float> getRevenue() {
        LinkedHashMap<String, Float> revenue = new LinkedHashMap<>();
        Connection conn = null;
        Statement stmt = null;
        try {
            DBContext dbContext = new DBContext();
            conn = dbContext.getConnection();
            stmt = conn.createStatement();

            String query = "SELECT DATE(Date) AS OrderDate, COUNT(*) AS TotalOrders, SUM(TotalPrice) AS TotalRevenue "
                    + "FROM `Order` "
                    + "GROUP BY OrderDate ORDER BY OrderDate;";
            ResultSet rs = stmt.executeQuery(query);

            while (rs.next()) {
                String orderDate = rs.getString("OrderDate");
                int totalOrders = rs.getInt("TotalOrders");
                float totalRevenue = rs.getFloat("TotalRevenue");

                revenue.put(orderDate, totalRevenue);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (stmt != null) {
                    stmt.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException se) {
                se.printStackTrace();
            }
        }
        return revenue;
    }

    public List<String> getAllDate() {
        List<String> allDates = new ArrayList<>();
        String sql = "SELECT Date FROM mydb.order";
        try {
            con = new DBContext().getConnection(); // Open a connection to MySQL
            System.out.println("Connected to MySQL!"); // Add this line for logging

            ps = con.prepareStatement(sql);

            rs = ps.executeQuery();

            while (rs.next()) {
                String date = rs.getString("Date"); // Thay date_column bằng tên cột chứa ngày trong bảng của bạn
                allDates.add(date);
            }
        } catch (Exception e) {
            e.printStackTrace(); // Print the exception details for debugging
        } finally {
            try {
                if (con != null) {
                    con.close(); // Close the connection in the finally block
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return allDates;
    }

    public Object[] countData() {
        Object[] fetchDataDashboard = new Object[5]; // Initialize the variable

        try {
            String sql = "SELECT \n"
                    + "    COUNT(*) AS totalOrders, \n"
                    + "    SUM(TotalPrice) AS totalRevenue \n"
                    + "FROM \n"
                    + "    `order` \n"
                    + "WHERE \n"
                    + "    Status = 3 OR Status = 11;";
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            // Process the result set and get the count
            if (rs.next()) {
                fetchDataDashboard[0] = rs.getInt(1);
                fetchDataDashboard[1] = rs.getFloat(2);
                fetchDataDashboard[2] = rs.getInt(3);
                fetchDataDashboard[3] = rs.getInt(4);
                fetchDataDashboard[4] = rs.getInt(5);

            }

        } catch (SQLException ex) {
            Logger.getLogger(MarketingDashboradDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(MarketingDashboradDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return fetchDataDashboard;
    }

    public Map<String, Integer> countTrendOrder(String startDate, String endDate) {
        Map<String, Integer> map = new LinkedHashMap<>();

        try {
            con = new DBContext().getConnection();

            // Create temporary table
            String createTableSQL = "CREATE TEMPORARY TABLE DateSeries (DateValue DATE);";
            ps = con.prepareStatement(createTableSQL);
            ps.execute();

            // Insert values into the temporary table
            String insertValuesSQL = "INSERT INTO DateSeries (DateValue) "
                    + "SELECT DATE(?) + INTERVAL (a.a + (10 * b.a) + (100 * c.a)) DAY "
                    + "FROM (SELECT 0 AS a UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9) AS a "
                    + "CROSS JOIN (SELECT 0 AS a UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9) AS b "
                    + "CROSS JOIN (SELECT 0 AS a UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9) AS c "
                    + "WHERE DATE(?) + INTERVAL (a.a + (10 * b.a) + (100 * c.a)) DAY < ?;";
            ps = con.prepareStatement(insertValuesSQL);
            ps.setString(1, startDate);
            ps.setString(2, startDate);
            ps.setString(3, endDate);
            ps.execute();

            // Select data from the temporary table
            String selectDataSQL = "SELECT DateSeries.DateValue, COUNT(order.Date) AS OrderCount "
                    + "FROM DateSeries "
                    + "LEFT JOIN mydb.order ON DATE(DateSeries.DateValue) = DATE(order.Date) AND (order.Status = 11 OR order.Status = 3) "
                    + "WHERE DateSeries.DateValue >= ? AND DateSeries.DateValue < ? "
                    + "GROUP BY DateSeries.DateValue "
                    + "ORDER BY DateSeries.DateValue;";
            ps = con.prepareStatement(selectDataSQL);
            ps.setString(1, startDate);
            ps.setString(2, endDate);
            rs = ps.executeQuery();

            // Process the result set and put the counts into the map
            while (rs.next()) {
                String dateValue = rs.getString("DateValue");
                int accountCount = rs.getInt("OrderCount");
                map.put(dateValue, accountCount);
            }

            // Drop the temporary table
            String dropTableSQL = "DROP TEMPORARY TABLE IF EXISTS DateSeries;";
            ps = con.prepareStatement(dropTableSQL);
            ps.execute();

        } catch (SQLException ex) {
            Logger.getLogger(MarketingDashboradDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(MarketingDashboradDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            // Close resources (result sets, statements, and connection) in a 'finally' block
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return map;
    }

    public Map<String, Float> countTrendRevenue(String startDate, String endDate) {
        Map<String, Float> map = new LinkedHashMap<>();

        try {
            con = new DBContext().getConnection();

            // Create temporary table
            String createTableSQL = "CREATE TEMPORARY TABLE DateSeries (DateValue DATE);";
            ps = con.prepareStatement(createTableSQL);
            ps.execute();

            // Insert values into the temporary table
            String insertValuesSQL = "INSERT INTO DateSeries (DateValue) "
                    + "SELECT DATE(?) + INTERVAL (a.a + (10 * b.a) + (100 * c.a)) DAY "
                    + "FROM (SELECT 0 AS a UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9) AS a "
                    + "CROSS JOIN (SELECT 0 AS a UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9) AS b "
                    + "CROSS JOIN (SELECT 0 AS a UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9) AS c "
                    + "WHERE DATE(?) + INTERVAL (a.a + (10 * b.a) + (100 * c.a)) DAY < ?;";
            ps = con.prepareStatement(insertValuesSQL);
            ps.setString(1, startDate);
            ps.setString(2, startDate);
            ps.setString(3, endDate);
            ps.execute();

            // Select data from the temporary table
            String selectDataSQL = "SELECT DateSeries.DateValue, SUM(TotalPrice) AS TotalRevenue  "
                    + "FROM DateSeries "
                    + "LEFT JOIN mydb.order ON DATE(DateSeries.DateValue) = DATE(order.Date) AND (order.Status = 11 OR order.Status = 3) "
                    + "WHERE DateSeries.DateValue >= ? AND DateSeries.DateValue < ? "
                    + "GROUP BY DateSeries.DateValue "
                    + "ORDER BY DateSeries.DateValue;";
            ps = con.prepareStatement(selectDataSQL);
            ps.setString(1, startDate);
            ps.setString(2, endDate);
            rs = ps.executeQuery();

            // Process the result set and put the counts into the map
            while (rs.next()) {
                String dateValue = rs.getString("DateValue");
                float accountCount = rs.getFloat("TotalRevenue");
                map.put(dateValue, accountCount);
            }

            // Drop the temporary table
            String dropTableSQL = "DROP TEMPORARY TABLE IF EXISTS DateSeries;";
            ps = con.prepareStatement(dropTableSQL);
            ps.execute();

        } catch (SQLException ex) {
            Logger.getLogger(MarketingDashboradDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(MarketingDashboradDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            // Close resources (result sets, statements, and connection) in a 'finally' block
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return map;
    }

    public static void main(String[] args) {
        SaleDashboardDAO sd = new SaleDashboardDAO();

        Map<String, Float> date = sd.countTrendRevenue("2024-01-10", "2024-01-23");
        System.out.println(date);
    }
}
