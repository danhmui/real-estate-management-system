# Real Estate Management System

A web-based Real Estate Management System built with Spring Boot, Spring Data JPA, MySQL, and JSP, deployed on Apache Tomcat.

## 🚀 Tech Stack

* **Backend:** Java (JDK 8+), Spring Boot, Spring MVC, Spring Data JPA, Hibernate, Lombok
* **Database:** MySQL (`project_db`)
* **View:** JSP, JSTL, Sitemesh, HTML/CSS, JavaScript, Ajax
* **Server:** Apache Tomcat (External)
* **Build Tool:** Maven

## 📋 Prerequisites & Setup

1. **Clone this repository:**
   ```bash
   git clone https://github.com/danhmui/real-estate-management-system.git

2. **Create a MySQL database named project_db and import your SQL script.**

3. **Configure your database credentials in spring-boot-web/src/main/resources/application.properties:**
    ```properties
   spring.datasource.url = jdbc:mysql://localhost:3306/project_db
   spring.datasource.username = root
   spring.datasource.password = your_password

4. **IDE & Project Configuration (IntelliJ IDEA)**
    
    * Open the project folder in IntelliJ IDEA.

    * Configure Project Structure:

        * Go to File > Project Structure (Ctrl + Alt + Shift + S).

        * Set Project SDK to Java 8 (or your compatible JDK version).

        * Set Project language level to 8 - Lambdas, type annotations, etc..

    * Sync Maven:

        * Open the Maven tab and click Reload All Maven Projects to download all dependencies.

5. **Configure Apache Tomcat (External)**

    * **Since this project runs on an external Tomcat server:**

        * Go to Add Configuration... > Tomcat Server > Local.

        * Go to the Deployment tab, click +, select Artifact..., and choose the war exploded artifact of the project.

        * Set the Application context (e.g., / or /real-estate).

        * Click Apply and OK.

6. **Run the Application**
    
    * Click the Run (▶) button for Tomcat in IntelliJ IDEA.

    * Open your browser and navigate to: http://localhost:8080/[your-context-path]

## 🔑 Test Accounts
You can use the following default accounts to test different roles in the system:

* **Manager Account:**
  * Username: `nguyenvana`
  * Password: `123456`
  
* **Staff Account:**
  * Username: `nguyenvanb`
  * Password: `123456`