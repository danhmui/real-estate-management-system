# Real Estate Management System (Project 2)

A web-based Real Estate Management System built with Spring Boot, Spring Data JPA, MySQL, and JSP.

## 🚀 Tech Stack

* **Backend:** Java, Spring Boot, Spring MVC, Spring Data JPA, Hibernate
* **Database:** MySQL (`project_db`)
* **View:** JSP, HTML/CSS, JavaScript
* **Build Tool:** Maven

## 📋 Prerequisites & Setup

1. **Clone this repository:**
   ```bash
   git clone https://github.com/danhmui/real-estate-management-system.git

2. Create a MySQL database named project_db and import your SQL script.

3. Configure your database credentials in spring-boot-web/src/main/resources/application.properties:
    ```properties
   spring.datasource.url = jdbc:mysql://localhost:3306/project_db
   spring.datasource.username = root
   spring.datasource.password = your_password

4. Run the Spring Boot application from your IDE or using Maven.

## 🔑 Test Accounts
You can use the following default accounts to test different roles in the system:

* **Manager Account:**
  * Username: `nguyenvana`
  * Password: `123456`
  
* **Staff Account:**
  * Username: `nguyenvanb`
  * Password: `123456`