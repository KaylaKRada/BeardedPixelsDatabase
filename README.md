# 🛠️ Bearded Pixels Studio – PostgreSQL Database for Admin Panel  
**Course:** Modern Databases 
**Created by:** Kayla Rada  

---

## ✨ Overview  
This is the PostgreSQL database that powers the admin panel for my final Java 2 project: *Bearded Pixels Studio*, a photography business platform. It manages everything from photo albums and client bookings to photos and admin access.

The database was designed to support a full-stack web application built with Spring Boot and PostgreSQL, giving admins the ability to dynamically update albums, photos, and client data in real-time.  

It's one of the largest and most structured databases I've built to date, and it reflects everything I’ve learned about data relationships, normalization, and real-world backend development.

---

## 🚗 CCARR Breakdown (Challenge, Context, Action, Result, Reflection)

### 🔹 **Challenge / Context**  
As part of my Modern Databases project, I needed a backend that could support a photography business dashboard, complete with users, albums, bookings, and photo uploading. I wanted to build something scalable and realistic, with clear table relationships and clean organization.

### 🔧 **Action**  
I designed and implemented a relational schema with 9 core tables: `admins`, `albums`, `photos`, `clients`, `bookings`, `orders`, and more. I mapped out relationships (e.g., one-to-many between albums and photos, many-to-many between bookings and clients), and connected everything through Spring Boot using JPA and PostgreSQL.

### ✅ **Result**  
The database integrates seamlessly with the admin panel, enabling features like:
- Uploading and organizing photo albums  
- Viewing and managing client sessions  
- Booking tracking and order history  
- Admin login and user management

Everything is dynamic and connected, reflecting updates instantly on the main website.

### 💭 **Reflection**  
This was a huge step forward for me in backend development. I had to think about how real businesses manage data and how to structure tables to allow both flexibility and scalability. The process taught me the importance of clean schema design and gave me confidence in building out full-stack applications from scratch.

---

## 📁 Files Included  
- `bearded_pixels_studio_schema.sql` – SQL file to recreate the database schema  
- `DATABASE.md` – Human-readable visual of table relationships and purposes  
- `README.md` – You're reading it!

---

## 🗃️ Tables Included
- `admin` – Stores admin login credentials  
- `albums` – Metadata for photo albums  
- `album_photos` – Link table for organizing photos into albums  
- `photos` – Stores uploaded photo data  
- `clients` – Client information for session tracking  
- `bookings` – Tracks client bookings and session details  
- `booking_clients` – Join table for bookings to clients  
- `orders` – Client orders for prints/products  
- `order_items` – Details for each item in an order  

---

## 💡 Highlights
- 🛠️ Technologies: PostgreSQL, Spring Boot, JPA, SQL, Entity Relationships
- 🔄 Fully normalized schema  
- 🔗 Clear table relationships with foreign keys  
- 📸 Built to support a real photography business  
- 🔐 Admin-first design with user management  
