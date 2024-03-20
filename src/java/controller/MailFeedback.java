/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.OrderDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Order;

/**
 *
 * @author MM
 */
public class MailFeedback extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet MailFeedback</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet MailFeedback at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        OrderDAO o = new OrderDAO();
        int oid = Integer.parseInt(request.getParameter("orderID"));
        Order order = o.get1OrderbyOrderID(oid);
        String htmlForm = "<!DOCTYPE html>\n"
                + "<html lang=\"en\">\n"
                + "  <head>\n"
                + "    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />\n"
                + "    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\" />\n"
                + "    <style type=\"text/css\">\n"
                + "      /* CLIENT-SPECIFIC STYLES */\n"
                + "      body,\n"
                + "      table,\n"
                + "      td,\n"
                + "      a {\n"
                + "        -webkit-text-size-adjust: 100%;\n"
                + "        -ms-text-size-adjust: 100%;\n"
                + "      }\n"
                + "      table,\n"
                + "      td {\n"
                + "        mso-table-lspace: 0pt;\n"
                + "        mso-table-rspace: 0pt;\n"
                + "      }\n"
                + "      img {\n"
                + "        -ms-interpolation-mode: bicubic;\n"
                + "      }\n"
                + "\n"
                + "      /* RESET STYLES */\n"
                + "      img {\n"
                + "        border: 0;\n"
                + "        height: auto;\n"
                + "        line-height: 100%;\n"
                + "        outline: none;\n"
                + "        text-decoration: none;\n"
                + "      }\n"
                + "      table {\n"
                + "        border-collapse: collapse !important;\n"
                + "      }\n"
                + "      body {\n"
                + "        height: 100% !important;\n"
                + "        margin: 0 !important;\n"
                + "        padding: 0 !important;\n"
                + "        width: 100% !important;\n"
                + "      }\n"
                + "    </style>\n"
                + "  </head>\n"
                + "  <body\n"
                + "    style=\"\n"
                + "      background-color: black;\n"
                + "      margin: 0 !important;\n"
                + "      padding: 60px 0 60px 0 !important;\n"
                + "    \"\n"
                + "  >\n"
                + "    <table\n"
                + "      border=\"0\"\n"
                + "      cellspacing=\"0\"\n"
                + "      cellpadding=\"0\"\n"
                + "      role=\"presentation\"\n"
                + "      width=\"100%\"\n"
                + "    >\n"
                + "      <tr>\n"
                + "        <td bgcolor=\"black\" style=\"font-size: 0\">&​nbsp;</td>\n"
                + "        <td\n"
                + "          bgcolor=\"black\"\n"
                + "          width=\"600\"\n"
                + "          style=\"\n"
                + "            border-radius: 4px;\n"
                + "            color: grey;\n"
                + "            font-family: sans-serif;\n"
                + "            font-size: 18px;\n"
                + "            line-height: 28px;\n"
                + "            padding: 40px 40px;\n"
                + "          \"\n"
                + "        >\n"
                + "          <article>\n"
                + "            <h1\n"
                + "              style=\"\n"
                + "                color: white;\n"
                + "                font-size: 32px;\n"
                + "                font-weight: bold;\n"
                + "                line-height: 36px;\n"
                + "                margin: 0 0 30px 0;\n"
                + "                text-align: center;\n"
                + "              \"\n"
                + "            >\n"
                + "              WE NEED YOU\n"
                + "            </h1>\n"
                + "            <img\n"
                + "              alt=\"FEEDBACK NOW\"\n"
                + "              src=\"https://c4.wallpaperflare.com/wallpaper/84/429/242/moon-phases-moon-space-hd-wallpaper-preview.jpg\"\n"
                + "              height=\"300\"\n"
                + "              width=\"600\"\n"
                + "              style=\"\n"
                + "                background-color: black;\n"
                + "                color: #f8c433;\n"
                + "                display: block;\n"
                + "                font-family: sans-serif;\n"
                + "                font-size: 72px;\n"
                + "                font-weight: bold;\n"
                + "                height: auto;\n"
                + "                max-width: 100%;\n"
                + "                text-align: center;\n"
                + "                width: 100%;\n"
                + "              \"\n"
                + "            />\n"
                + "            <!-- Photo by Josh Nuttall on Unsplash -->\n"
                + "            <p style=\"margin: 30px 0 30px 0\"></p>\n"
                + "            <p style=\"margin: 30px 0 30px 0; text-align: center\">\n"
                + "              <a\n"
                + "                href=\"http://localhost:8080/Fruitshop/OrderInformation?oid=" + oid + "\"\n" 
                + "                target=\"_blank\"\n"
                + "                style=\"\n"
                + "                \n"
                + "                  font-size: 18px;\n"
                + "                  font-family: sans-serif;\n"
                + "                  font-weight: bold;\n"
                + "                  color: black;\n"
                + "                  text-decoration: none;\n"
                + "                  border-radius: 8px;\n"
                + "                  -webkit-border-radius: 8px;\n"
                + "                  background-color: #f8c433;\n"
                + "                  border-top: 20px solid #f8c433;\n"
                + "                  border-bottom: 18px solid #f8c433;\n"
                + "                  border-right: 40px solid #f8c433;\n"
                + "                  border-left: 40px solid #f8c433;\n"
                + "                  display: inline-block;\n"
                + "                \"\n"
                + "                >Feedback</a\n"
                + "              >\n"
                + "            </p>\n"
                + "            <p style=\"margin: 0 0 30px 0\">\n"
                + "              Thank you for experiencing our products, please leave us your\n"
                + "              thoughts through feedback from others. Thank you and see you again\n"
                + "              on your next purchase. Click the button above so we can listen to\n"
                + "              everyone.\n"
                + "            </p>\n"
                + "          </article>\n"
                + "        </td>\n"
                + "        <td bgcolor=\"black\" style=\"font-size: 0\">&​nbsp;</td>\n"
                + "      </tr>\n"
                + "    </table>\n"
                + "  </body>\n"
                + "</html>";

        final String from = "quaithugaoru@gmail.com";
//        final String password = "abcd auht ?ids jicx";
        final String passwordv = "oqtt qcwz fqsx lnug";

        //properties khai bao thuoc tinh
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");//smtp host
        props.put("mail.smtp.port", "587");//TLS 587 SSL 465
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");

        //create Authenticator
        Authenticator auth = new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(from, passwordv);
            }

        };
        //phien lam viec 
        Session session = Session.getInstance(props, auth);

        //gui email
        final String to = order.getAccount().getEmail();
        //tao 1 tin nhan
        MimeMessage msg = new MimeMessage(session);
        try {
            //kieu noi dung
            msg.addHeader("Content-type", "text/HTML; charset=UTF-8");
            //nguoi gui
            msg.setFrom(from);
            //nguoi nhan
            msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to, false));
            //tieu de email
            msg.setSubject("Feedback Mail: ");
            //Quy dinh ngay gui
            msg.setSentDate(new Date());
            //Quy dinh email nhan phan hoi

            msg.setContent(htmlForm, "text/html; charset=utf-8");

            //gui email
            Transport.send(msg);
        } catch (Exception e) {
            e.printStackTrace();
        }
        response.sendRedirect("OrderList");
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
