<?php

namespace Database\Seeders;

use App\Models\User;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;

class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $users = [
            ['User 1', 'user1@example.com', 'password'],
            ['User 2', 'user2@example.com', 'password'],
            ['User 3', 'user3@example.com', 'password'],
            ['User 4', 'user4@example.com', 'password'],
            ['User 5', 'user5@example.com', 'password'],
            ['User 6', 'user6@example.com', 'password'],
            ['User 7', 'user7@example.com', 'password'],
            ['User 8', 'user8@example.com', 'password'],
            ['User 9', 'user9@example.com', 'password'],
            ['User 10', 'user10@example.com', 'password'],
        ];

        foreach ($users as $user) {
            User::create([
                'name' => $user[0],
                'email' => $user[1],
                'password' => $user[2],
            ]);
        }
    }
}
