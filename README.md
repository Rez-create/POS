RetailPOS — Point of Sale and Inventory Management System

A web-based retail management system built with ASP.NET Core MVC, C#, Entity Framework Core, and Microsoft SQL Server. RetailPOS helps retail businesses manage products, inventory, sales transactions, and business operations through a centralized application.

Table of Contents

1. "Project Title and Short Description" (#1-project-title-and-short-description)
2. "Overview" (#2-overview)
3. "Features" (#3-features)
4. "Technology Stack" (#4-technology-stack)
5. "System Architecture" (#5-system-architecture)
6. "Application Pages" (#6-application-pages)
7. "Database Design and ERD" (#7-database-design-and-erd)
8. "Installation and Setup" (#8-installation-and-setup)
9. "Configuration" (#9-configuration)
10. "Project Structure" (#10-project-structure)
11. "Security Considerations" (#11-security-considerations)

---

1. Project Title and Short Description

Project Title: RetailPOS — Point of Sale and Inventory Management System

Short Description:

RetailPOS is a web-based application designed to streamline retail operations by providing tools for processing sales, managing products, monitoring stock levels, generating receipts, and viewing sales information.

The system uses ASP.NET Core MVC for application development, Entity Framework Core for database operations, and Microsoft SQL Server for persistent data storage.

2. Overview

RetailPOS is designed to simplify the daily operations of small and medium-sized retail businesses by replacing manual sales recording and stock tracking with a centralized digital solution.

The system allows authorized users to manage products, process customer purchases, track inventory changes, and review sales performance. It aims to improve transaction accuracy, maintain consistent inventory records, and make business information easier to access.

Project Objectives

- Develop a functional web-based point-of-sale application.
- Automate sales transaction recording and calculations.
- Manage products, categories, and inventory.
- Update product stock after successful sales.
- Generate transaction receipts.
- Provide sales summaries and inventory information.
- Implement authentication and role-based access control.
- Maintain data integrity through relational database constraints and transactions.

Target Users

Administrator

- Manages products and categories.
- Monitors inventory and stock movements.
- Views sales reports.
- Manages user accounts and permissions.

Cashier

- Searches for products.
- Processes customer purchases.
- Records payment methods.
- Generates and prints receipts.
- Views sales information permitted by their role.

3. Features

3.1 User Authentication and Authorization

- Secure user login and logout.
- Administrator and cashier roles.
- Role-based access to application pages.
- Protected administrative operations.
- User account management.

3.2 Product Management

- Add, view, edit, and deactivate products.
- Assign products to categories.
- Maintain unique product SKUs.
- Set cost prices and selling prices.
- Search and filter products.
- Validate product information before saving.

3.3 Category Management

- Create and update product categories.
- View products within each category.
- Deactivate categories when they are no longer in use.
- Prevent invalid category assignments.

3.4 Inventory Management

- View available stock quantities.
- Record stock additions and adjustments.
- Automatically reduce stock after successful sales.
- Identify products that have reached their reorder levels.
- Maintain stock movement records.
- Prevent transactions from selling more stock than is available.

3.5 Point of Sale

- Search for products by name or SKU.
- Add products to a shopping cart.
- Update item quantities and remove cart items.
- Calculate subtotals, discounts, and final totals.
- Record payment methods such as cash, card, or M-Pesa.
- Validate stock availability before completing transactions.
- Generate receipts after successful sales.
- Calculate change for applicable payment methods.

Note: Recording M-Pesa as a payment method does not itself provide payment processing. Actual M-Pesa integration requires a separate implementation.

3.6 Sales Management

- Record completed sales.
- Store individual items within each transaction.
- Generate unique receipt numbers.
- View transaction details.
- Search sales history.
- Print receipts.
- Preserve historical transaction prices.

3.7 Dashboard and Reporting

- Display sales summaries.
- Show transaction counts.
- Display product and inventory statistics.
- Identify low-stock products.
- Summarize sales over selected periods.
- Display recent transactions.
- Identify top-selling products where reporting is implemented.

4. Technology Stack

Component| Technology| Purpose
Backend framework| ASP.NET Core MVC| Application logic and request handling
Programming language| C#| Backend development
Frontend| Razor Views, HTML, CSS, JavaScript| User interface
CSS framework| Bootstrap 5| Responsive layouts and components
Database| Microsoft SQL Server| Persistent data storage
ORM| Entity Framework Core| Database access and object-relational mapping
Authentication| ASP.NET Core Identity| User authentication and role management
Version control| Git| Source code versioning
Repository hosting| GitHub| Code hosting and collaboration
Charts| Chart.js (optional)| Dashboard visualizations

The selected .NET, ASP.NET Core, and Entity Framework Core versions should be compatible with the project's target framework.

5. System Architecture

RetailPOS follows the Model-View-Controller (MVC) architectural pattern, supported by a business services layer and a relational database.

Architecture Diagram

flowchart TD
    U[Administrator / Cashier]
    B[Web Browser]
    V[Razor Views and Bootstrap]
    C[ASP.NET Core MVC Controllers]
    S[Business Services]
    E[Entity Framework Core]
    D[(Microsoft SQL Server)]
    I[ASP.NET Core Identity]

    U --> B
    B <--> V
    V <--> C
    C --> S
    S --> E
    E <--> D
    C <--> I
    I <--> D

5.1 Presentation Layer

The presentation layer contains Razor Views, HTML, CSS, JavaScript, and Bootstrap components.

Its responsibilities include:

- Displaying application pages.
- Collecting user input.
- Showing product and inventory information.
- Presenting validation errors and confirmation messages.
- Providing responsive navigation.

5.2 Controller Layer

The controller layer receives HTTP requests and coordinates application operations.

Expected controllers include:

- "DashboardController"
- "ProductsController"
- "CategoriesController"
- "InventoryController"
- "SalesController"
- "ReportsController"
- "UsersController"

Controllers should validate incoming requests and delegate reusable business operations to services where appropriate.

5.3 Business Logic Layer

The services layer contains the core business rules.

- "SalesService" — validates and completes sales transactions.
- "InventoryService" — manages stock changes and movement records.
- "ReportService" — calculates sales summaries and inventory reports.

Separating business logic from controllers makes the application easier to maintain and extend.

5.4 Data Access Layer

Entity Framework Core manages database access through "ApplicationDbContext".

Its responsibilities include:

- Mapping C# entities to database tables.
- Defining entity relationships.
- Executing database queries.
- Saving changes.
- Applying schema migrations.
- Supporting database transactions.

5.5 Database Layer

Microsoft SQL Server stores the application's persistent information, including products, categories, sales, sale items, stock movements, and user accounts.

Sales and associated inventory changes should be committed as a single database transaction to prevent partial updates when an operation fails.

6. Application Pages

The application is organized into pages that support different retail operations.

Page| Suggested Route| Description| Access
Login| "/Identity/Account/Login"| Authenticates users| Public
Dashboard| "/Dashboard/Index"| Displays business summaries| Authenticated users
Products| "/Products"| Lists and searches products| Administrator
Create Product| "/Products/Create"| Adds a new product| Administrator
Edit Product| "/Products/Edit/{id}"| Updates product information| Administrator
Categories| "/Categories"| Manages product categories| Administrator
Inventory| "/Inventory"| Displays stock quantities| Administrator
Stock Adjustment| "/Inventory/Adjust"| Records inventory adjustments| Administrator
New Sale| "/Sales/Create"| Processes a sale| Administrator, Cashier
Sales History| "/Sales"| Displays transaction history| Authorized users
Sale Details| "/Sales/Details/{id}"| Displays transaction information| Authorized users
Receipt| "/Sales/Receipt/{id}"| Displays and prints a receipt| Authorized users
Reports| "/Reports"| Displays sales and inventory reports| Administrator
User Management| "/Users"| Manages application users| Administrator
Profile| "/Account/Profile"| Displays user account information| Authenticated users

These routes are illustrative and should match the actual controllers and actions implemented in the project.

6.1 Dashboard

The dashboard provides an overview of retail operations, including:

- Total sales for a selected period.
- Number of completed transactions.
- Number of active products.
- Low-stock product count.
- Recent transactions.
- Top-selling products.

6.2 Product Management

The product management page displays product names, SKUs, categories, prices, stock quantities, and stock status.

Administrators can create and update product information, search existing records, and deactivate discontinued products.

6.3 Inventory Management

The inventory page displays current stock quantities and reorder levels. Authorized users can record stock adjustments and review stock movement history.

6.4 Point-of-Sale Terminal

The sales terminal provides product search, cart management, quantity controls, price calculations, payment method selection, and receipt generation.

All important calculations and stock checks must be validated on the server before a sale is completed.

6.5 Sales and Receipts

The sales history page displays completed transactions and allows authorized users to view individual sale details.

The receipt page presents the receipt number, transaction date, purchased items, quantities, prices, total amount, and payment information.

7. Database Design and ERD

RetailPOS uses a relational database implemented in Microsoft SQL Server and managed through Entity Framework Core.

The core database consists of five business entities:

1. Categories
2. Products
3. Sales
4. SaleItems
5. StockMovements

ASP.NET Core Identity manages the user and role tables.

7.1 Categories Table

Stores the categories used to organize products.

Field| Data Type| Description
"CategoryId"| "int"| Primary key
"Name"| "nvarchar(100)"| Category name
"Description"| "nvarchar(500)"| Optional category description
"IsActive"| "bit"| Indicates whether the category is active

7.2 Products Table

Stores product information and current inventory quantities.

Field| Data Type| Description
"ProductId"| "int"| Primary key
"CategoryId"| "int"| Foreign key to Categories
"SKU"| "nvarchar(50)"| Unique product identifier
"Name"| "nvarchar(150)"| Product name
"Description"| "nvarchar(500)"| Optional product description
"CostPrice"| "decimal(18,2)"| Product cost
"SellingPrice"| "decimal(18,2)"| Customer selling price
"StockQuantity"| "int"| Current available quantity
"ReorderLevel"| "int"| Minimum desired stock quantity
"IsActive"| "bit"| Indicates whether the product is active
"CreatedAt"| "datetime2"| Creation timestamp

7.3 Sales Table

Stores the main information for each sales transaction.

Field| Data Type| Description
"SaleId"| "int"| Primary key
"ReceiptNumber"| "nvarchar(30)"| Unique receipt number
"UserId"| "nvarchar(450)"| Foreign key to the Identity user
"SaleDate"| "datetime2"| Transaction date and time
"Subtotal"| "decimal(18,2)"| Total before discount
"Discount"| "decimal(18,2)"| Discount applied
"TotalAmount"| "decimal(18,2)"| Final amount due
"PaymentMethod"| "nvarchar(30)"| Selected payment method
"AmountPaid"| "decimal(18,2)"| Amount received
"Status"| "nvarchar(20)"| Transaction status

7.4 SaleItems Table

Stores the individual products included in a transaction.

Field| Data Type| Description
"SaleItemId"| "int"| Primary key
"SaleId"| "int"| Foreign key to Sales
"ProductId"| "int"| Foreign key to Products
"Quantity"| "int"| Number of units sold
"UnitPrice"| "decimal(18,2)"| Price charged per unit
"LineTotal"| "decimal(18,2)"| Total for the sale item

The "UnitPrice" field preserves the price charged at the time of the transaction, even if the product's current selling price changes later.

7.5 StockMovements Table

Records inventory additions and reductions.

Field| Data Type| Description
"MovementId"| "int"| Primary key
"ProductId"| "int"| Foreign key to Products
"UserId"| "nvarchar(450)"| User who recorded the movement
"QuantityChange"| "int"| Positive for additions, negative for reductions
"Reason"| "nvarchar(200)"| Explanation for the movement
"Reference"| "nvarchar(50)"| Optional transaction reference
"CreatedAt"| "datetime2"| Movement timestamp

7.6 Identity Tables

ASP.NET Core Identity manages user accounts and roles through tables that typically include:

- "AspNetUsers"
- "AspNetRoles"
- "AspNetUserRoles"
- "AspNetUserClaims"
- "AspNetUserLogins"
- "AspNetRoleClaims"
- "AspNetUserTokens"

The actual tables depend on the Identity version and project configuration.

7.7 Entity Relationship Diagram

erDiagram
    CATEGORIES ||--o{ PRODUCTS : categorizes
    PRODUCTS ||--o{ SALE_ITEMS : appears_in
    SALES ||--|{ SALE_ITEMS : contains
    ASP_NET_USERS ||--o{ SALES : processes
    PRODUCTS ||--o{ STOCK_MOVEMENTS : has
    ASP_NET_USERS ||--o{ STOCK_MOVEMENTS : records

    CATEGORIES {
        int CategoryId PK
        string Name
        string Description
        boolean IsActive
    }

    PRODUCTS {
        int ProductId PK
        int CategoryId FK
        string SKU UK
        string Name
        decimal CostPrice
        decimal SellingPrice
        int StockQuantity
        int ReorderLevel
        boolean IsActive
    }

    SALES {
        int SaleId PK
        string ReceiptNumber UK
        string UserId FK
        datetime SaleDate
        decimal Subtotal
        decimal Discount
        decimal TotalAmount
        string PaymentMethod
        decimal AmountPaid
        string Status
    }

    SALE_ITEMS {
        int SaleItemId PK
        int SaleId FK
        int ProductId FK
        int Quantity
        decimal UnitPrice
        decimal LineTotal
    }

    STOCK_MOVEMENTS {
        int MovementId PK
        int ProductId FK
        string UserId FK
        int QuantityChange
        string Reason
        datetime CreatedAt
    }

    ASP_NET_USERS {
        string Id PK
        string UserName
        string Email
    }

7.8 Database Relationships

- One category can contain multiple products.
- Each product belongs to a category.
- One sale contains one or more sale items.
- Each sale item references a product.
- A product can appear in many sale items.
- One user can process multiple sales.
- A product can have multiple stock movement records.
- One user can record multiple stock movements.

7.9 Database Constraints and Business Rules

- Product SKUs and receipt numbers must be unique.
- Prices, discounts, and stock quantities must not be negative.
- Sale item quantities must be greater than zero.
- Inactive products cannot be added to new sales.
- The server must calculate the transaction total.
- A sale cannot exceed available stock.
- Sale records and inventory changes must be saved transactionally.
- Failed transactions must not leave partial database changes.
- Products associated with historical sales should normally be deactivated instead of deleted.

Core calculations:

"LineTotal = Quantity × UnitPrice"

"Subtotal = Sum of LineTotals"

"TotalAmount = Subtotal − Discount"

"Change = AmountPaid − TotalAmount"

8. Installation and Setup

8.1 Prerequisites

Ensure that the following tools are available:

- .NET SDK compatible with the project's target framework.
- Microsoft SQL Server.
- Visual Studio or Visual Studio Code.
- Git.
- A SQL Server management tool, where applicable.

Developers on Linux may use a supported remote SQL Server instance or a suitable SQL Server container environment.

8.2 Clone the Repository

Clone the project repository:

git clone <REPOSITORY_URL>
cd RetailPOS

Replace "<REPOSITORY_URL>" with the actual repository address.

8.3 Verify the .NET Installation

dotnet --info
dotnet --list-sdks

Confirm that the installed SDK supports the target framework specified in the project file.

8.4 Restore Dependencies

dotnet restore

If the project does not already contain the required Entity Framework Core packages, add compatible versions:

dotnet add package Microsoft.EntityFrameworkCore.SqlServer
dotnet add package Microsoft.EntityFrameworkCore.Design
dotnet add package Microsoft.AspNetCore.Identity.EntityFrameworkCore

Install the Entity Framework Core command-line tool if necessary:

dotnet tool install --global dotnet-ef

If the tool is already installed, update it when required instead of reinstalling it.

8.5 Create the Database

Create a SQL Server database named "RetailPOSDb".

Configure a connection string appropriate for your environment, as described in the Configuration section.

8.6 Apply Database Migrations

If the project already contains migrations, apply them:

dotnet ef database update

If the project has no migrations yet, create the initial migration first:

dotnet ef migrations add InitialCreate
dotnet ef database update

Run migration commands from the directory containing the project file, or specify the project path where necessary.

8.7 Run the Application

Build the project:

dotnet build

Start the application:

dotnet run

Open the local URL displayed in the terminal.

8.8 Initial User Setup

Use the application's configured Identity registration or administrator initialization process to create the first account.

The initial administrator account should be created securely. Avoid committing default administrator passwords to the repository or exposing administrative registration publicly.

9. Configuration

9.1 Database Connection String

RetailPOS requires a valid SQL Server connection string.

For local development, use .NET User Secrets:

dotnet user-secrets init
dotnet user-secrets set "ConnectionStrings:DefaultConnection" "<YOUR_SQL_SERVER_CONNECTION_STRING>"

Replace the placeholder with the appropriate connection string.

The application can read the configured value in "Program.cs":

builder.Services.AddDbContext<ApplicationDbContext>(options =>
    options.UseSqlServer(
        builder.Configuration.GetConnectionString("DefaultConnection")));

Ensure the required Entity Framework Core namespace is imported.

9.2 Environment Settings

The application can use different configuration settings for development and production.

Development

- Local development database.
- Detailed diagnostic logging.
- Development-only test data.
- User Secrets for confidential configuration.

Production

- Protected database credentials.
- HTTPS.
- Restricted exception details.
- Appropriate logging and monitoring.
- Regular database backups.

9.3 Authentication and Roles

The initial role structure contains:

- "Admin"
- "Cashier"

Use the same role names consistently in Identity configuration and authorization attributes.

Example:

[Authorize(Roles = "Admin")]
public class ProductsController : Controller
{
    // Administrator-only operations.
}

For sales operations:

[Authorize(Roles = "Admin,Cashier")]
public class SalesController : Controller
{
    // Operations available to administrators and cashiers.
}

These examples must be adapted to the project's actual controller names and role configuration.

9.4 Application Settings

The "appsettings.json" file can contain non-secret application settings, logging configuration, and other environment-independent options.

Do not commit production passwords, API credentials, or other sensitive values to source control.

9.5 Database Initialization

Use Entity Framework Core migrations to create and update the database schema.

If the project uses seed data, ensure that initialization is repeatable and does not create duplicate records each time the application starts.

10. Project Structure

The recommended project structure is:

RetailPOS/
├── Areas/
│   └── Identity/
│       └── Pages/
├── Controllers/
│   ├── DashboardController.cs
│   ├── ProductsController.cs
│   ├── CategoriesController.cs
│   ├── InventoryController.cs
│   ├── SalesController.cs
│   ├── ReportsController.cs
│   └── UsersController.cs
├── Data/
│   ├── ApplicationDbContext.cs
│   └── DbInitializer.cs
├── Models/
│   ├── Category.cs
│   ├── Product.cs
│   ├── Sale.cs
│   ├── SaleItem.cs
│   └── StockMovement.cs
├── ViewModels/
│   ├── DashboardViewModel.cs
│   ├── ProductFormViewModel.cs
│   ├── CreateSaleViewModel.cs
│   ├── SaleReceiptViewModel.cs
│   └── SalesReportViewModel.cs
├── Services/
│   ├── SalesService.cs
│   ├── InventoryService.cs
│   └── ReportService.cs
├── Views/
│   ├── Shared/
│   │   ├── _Layout.cshtml
│   │   └── _ValidationScriptsPartial.cshtml
│   ├── Dashboard/
│   ├── Products/
│   ├── Categories/
│   ├── Inventory/
│   ├── Sales/
│   ├── Reports/
│   ├── Users/
│   └── _ViewImports.cshtml
├── wwwroot/
│   ├── css/
│   ├── js/
│   └── images/
├── Migrations/
├── appsettings.json
├── Program.cs
├── RetailPOS.csproj
├── .gitignore
└── README.md

The structure is a recommended organization. Optional folders and files should only be included if they exist in the implementation.

Folder Responsibilities

Folder| Responsibility
"Areas/Identity"| Customized Identity pages, if scaffolded
"Controllers"| Handle HTTP requests and coordinate operations
"Data"| Database context and initialization
"Models"| Define the main database entities
"ViewModels"| Represent data required by views and forms
"Services"| Contain reusable business logic
"Views"| Contain Razor templates for application pages
"wwwroot"| Store CSS, JavaScript, images, and other static files
"Migrations"| Track Entity Framework Core schema changes

Important Files

"Program.cs"

Configures application services, database access, Identity, middleware, routing, authentication, and authorization.

"ApplicationDbContext.cs"

Defines the application's Entity Framework Core database context and entity relationships.

"RetailPOS.csproj"

Specifies the target framework, project settings, and dependencies.

"appsettings.json"

Contains non-secret application configuration and logging settings.

"README.md"

Documents the project, architecture, features, setup, and configuration.

11. Security Considerations

Security is essential because RetailPOS processes business transactions, inventory records, and user accounts.

11.1 Authentication

- Use ASP.NET Core Identity for user authentication.
- Never store plaintext passwords.
- Use framework-provided password hashing.
- Require authentication for protected pages.
- Implement secure logout and session handling.

11.2 Authorization

- Enforce role-based access control on the server.
- Restrict product administration, inventory adjustments, and user management to authorized users.
- Allow cashiers to perform only permitted sales operations.
- Verify access to individual transactions before displaying receipts or sale details.
- Do not rely solely on hidden navigation links or client-side restrictions.

11.3 Input Validation

- Validate submitted information on the server.
- Use model validation and appropriate database constraints.
- Reject negative prices, discounts, and stock quantities.
- Validate product IDs, transaction quantities, and payment information.
- Use dedicated ViewModels to limit the data users can submit.
- Calculate sale totals on the server rather than trusting client-submitted amounts.

11.4 Database Security

- Keep connection strings and database credentials out of source control.
- Use parameterized database access through Entity Framework Core.
- Apply database constraints to protect data integrity.
- Use transactions when saving sales and associated stock changes.
- Restrict database permissions to the operations required by the application.
- Back up the database regularly.

11.5 Web Application Security

- Use HTTPS in production.
- Retain antiforgery protection for form submissions.
- Avoid displaying detailed exception messages to end users.
- Keep framework dependencies updated.
- Protect sensitive configuration using environment variables or an appropriate secrets manager.
- Apply authorization checks to every protected controller action.

11.6 Transaction Integrity

A completed sale should be recorded consistently with its sale items and inventory changes.

The application should:

1. Validate the user's authorization.
2. Retrieve the current product prices and available stock.
3. Validate quantities and discount rules.
4. Calculate the transaction totals on the server.
5. Save the sale and sale items.
6. Update inventory and record stock movements.
7. Commit all database changes together.

If any critical operation fails, the database transaction should be rolled back to prevent incomplete sales or inconsistent stock quantities.