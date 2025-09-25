# Laravel Project Setup Guide

Follow the steps below to set up and run this Laravel project locally.

---

## 📦 Requirements
- PHP >= 8.1
- Composer
- MySQL / PostgreSQL
- Node.js & NPM (if the project uses frontend assets like Vue/React/Inertia)
- Git

---

## ⚙️ Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd <project-folder>
   ```

2. **Install PHP dependencies**
   ```bash
   composer install
   ```

3. **Install frontend dependencies (optional)**
   ```bash
   npm install
   ```

4. **Copy environment file**
   ```bash
   cp .env.example .env
   ```

5. **Generate application key**
   ```bash
   php artisan key:generate
   ```

6. **Configure `.env` file**
   - Set database name, username, and password:
     ```env
     DB_DATABASE=your_database
     DB_USERNAME=your_username
     DB_PASSWORD=your_password
     ```

---

## 🗄️ Database

1. **Run migrations**
   ```bash
   php artisan migrate
   ```

2. **(Optional) Run seeders**
   ```bash
   php artisan db:seed
   ```
   or
   ```bash
   php artisan migrate --seed
   ```

---

## 🚀 Running the Project

1. **Start the Laravel server**
   ```bash
   php artisan serve
   ```

   Project will be available at:
   ```
   http://127.0.0.1:8000
   ```

2. **(Optional) Compile frontend assets**
   ```bash
   npm run dev
   ```

---

## 🧪 Additional Commands

- **Clear cache**
  ```bash
  php artisan cache:clear
  php artisan config:clear
  php artisan route:clear
  php artisan view:clear
  ```

- **Run tests**
  ```bash
  php artisan test
  ```

---

## ✅ Done!
You can now access the project in your browser at [http://127.0.0.1:8000](http://127.0.0.1:8000).
