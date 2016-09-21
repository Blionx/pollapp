<?php

use Illuminate\Database\Seeder;

class UserTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $users = [
        	[
        		'name'=>'Luis Pens',
        		'email'=>'pensluis@gmail.com',
        		'password'=> Hash::make('123456')
        	]
        ];
        foreach($users as $user){
        	\App\User::create($user);
        }
    }
}
