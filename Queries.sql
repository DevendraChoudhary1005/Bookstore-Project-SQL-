drop table if exists books;

create table books(
		book_id serial primary key,
		title varchar(100),
		Author Varchar(100),
		Genre varchar(50),
		published_year int,
		price numeric(10,2),
		stock int
)

drop table if exists customers;

create table customers(
		customer_id serial primary key,
		name varchar(100),
		email varchar(100),
		phone varchar(15),
		city varchar(50),
		country varchar(150)
);

drop table if exists orders;

create table orders(
		order_id serial primary key,
		customer_id int references customers(customer_id),
		book_id int references books(book_id),
		order_date date,
		quantity int,
		total_amount numeric(10,2)
);

-- Queries
-- 1). retrieve all the books in the "Fiction" genre

select * from books
where genre = 'Fiction';

-- 2). Find the books published after the year 1950

select * from books
where published_year > 1950;

-- 3). List all the cutomers from canada

select * from customers 
where country = 'Canada';

-- 4). Show orders placed in november

select * from orders
where extract(month from order_date) = 11;

-- 5). Retrieve the total stock of books available

select sum(stock) as total_stock_available
from books;

-- 6). Find the details of the most expensive book

select * from books
order by price desc
limit 1;

-- 7). Show all customers who ordered more than 1 quantity of a book

select * from orders
where quantity > 1;

-- 8). Retrieve all the order where the total amount exceeds 20

select * from orders
where total_amount > 20;

-- 9). List all the genre of the books table

select distinct(genre) as Genre 
from books;

-- 10). Book with lowest stock available

select * from books
order by stock
limit 1;

-- 11). Calculate the total revenue generated from all orders

select sum(total_amount) as total_revenue
from orders;

-- Advanced Queries
select * from books;
select * from customers;
select * from orders;

-- 1). Retrieve the total books sold for each genre

select b.genre, sum(o.quantity) as books_sold 
from orders o
join books b
on b.book_id = o.book_id
group by b.genre;

-- 2). Find the average price of books in the "Fantasy" genre

select genre, avg(price) as Avg_price
from books
where genre = 'Fantasy'
group by genre;

-- 3). List of customers who have placed atleast 2 orders

select o.customer_id, c.name, count(o.order_id) as order_count
from orders o
join customers c on c.customer_id = o.customer_id
group by o.customer_id, c.name
having count(order_id) >= 2;

-- 4). Find out the most frequently ordered book

select b.book_id, b.title, count(o.order_id) as order_count
from orders o
join books b on b.book_id = o.book_id
group by b.book_id, b.title 
order by order_count desc
limit 1;

-- 5). Show the top 3 most expensive books of 'Fantasy' Genre

select book_id, title, price 
from books
where genre = 'Fantasy'
order by price desc
limit 3;

-- 6). Retrieve the total quantity of books sold by each author

select b.author, sum(o.quantity) as books_sold
from orders o
join books b on b.book_id = o.book_id
group by b.author;

-- 7). List the cities where customers who spent over 30 are located

select distinct(c.city), o.total_amount 
from customers c
join orders o on c.customer_id = o.customer_id
where o.total_amount > 30;

-- 8). Find the customer who spent most on the orders

select c.customer_id, c.name, sum(o.total_amount) as Total_spent
from orders o
join customers c on c.customer_id = o.customer_id
group by c.customer_id, c.name
order by total_spent desc
limit 1;

-- 9). Calculate the stock remaining after fulfilling all orders

select b.title, ((b.stock) - sum(o.quantity)) as stock_remaining
from orders o
join books b on b.book_id = o.book_id
group by b.title, b.stock;


