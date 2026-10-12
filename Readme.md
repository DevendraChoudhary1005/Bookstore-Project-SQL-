# PostgreSQL Bookstore Database Analysis Project 📚

A comprehensive hands-on SQL project built using **PostgreSQL** to manage, query, and analyze a relational database system for a bookstore. This project demonstrates database schema design, data manipulation, table relationships via foreign keys, and analytical queries ranging from basic filtering to advanced multi-table joins and aggregations.

---

## 🗄️ Database Schema

The database consists of three core relational tables:

1. **`books`**: Stores catalog information including `book_id`, `title`, `author`, `genre`, `published_year`, `price`, and `stock`.
2. **`customers`**: Stores client contact details including `customer_id`, `name`, `email`, `phone`, `city`, and `country`.
3. **`orders`**: Handles transaction records, linking customers to books through foreign keys (`customer_id`, `book_id`) and recording `order_date`, `quantity`, and `total_amount`.

---

## 📂 Project Structure

```text
├── Books.csv        # Dataset containing book inventory and pricing details
├── Customers.csv    # Dataset containing customer demographics and locations
├── Orders.csv       # Dataset containing transaction records and quantities
└── Queries.sql      # Complete DDL setup script, basic queries, and advanced analytics
```

---

## 🔍 SQL Query Highlights

The project script (`Queries.sql`) is organized into fundamental and advanced analytical categories:

### 1. Basic & Intermediate Queries

* **Filtering & Conditions**: Retrieve books by specific genres (e.g., *Fiction*, *Fantasy*) or published after a certain year.
* **Geographical Filtering**: Filter customers based on specific regions (e.g., *Canada*).
* **Date Extractions**: Query transactions placed during specific calendar months (e.g., *November* using `EXTRACT`).
* **Sorting & Limits**: Find the most expensive, least expensive, or lowest-stock books using `ORDER BY` and `LIMIT`.
* **Aggregations**: Calculate total available stock and overall store revenue using `SUM()`.

### 2. Advanced Analytical Queries

* **Multi-Table Joins**: Combine `orders`, `books`, and `customers` to map transactions to their respective entities.
* **Grouping & Summarization**: Calculate total books sold per genre and total quantity sold per author.
* **Conditional Filtering with HAVING**: Identify loyal customers who have placed at least 2 orders.
* **Business Insights**: Find top-spending customers, frequently ordered books, top-priced genre selections, and calculate remaining stock levels after fulfilling all orders.

---

## 🚀 Getting Started

1. **Clone the Repository**:
```bash
git clone [https://github.com/YOUR-USERNAME/YOUR-REPO-NAME.git](https://github.com/YOUR-USERNAME/YOUR-REPO-NAME.git)

```


2. **Set up PostgreSQL**:
Open pgAdmin 4 or your preferred PostgreSQL interface and create a new database (e.g., `bookstore_db`).
3. **Run the Script**:
Open `Queries.csv` / `Queries.sql`, execute the table creation and data import blocks, and run the analytical queries to explore the dataset!

```
