<?php
use Illuminate\Support\Facades\DB;
use Illuminate\Database\Seeder;

class PackagesTableSeeder extends Seeder
{
    /**
    * Run the database seeds.
    *
    * @return void
    */
    public function run()
    {
        DB::table('packages')->insert([
            
            [
                'name' => 'Basic Plan',
                'price' => 50.99,
                'description' => 'basic plan',
                'duration' => 'yearly',
                'created_at' => date('Y-m-d H:i:s'),
                'updated_at' => date('Y-m-d H:i:s')
            ],
            [
                'name' => 'Business Plan',
                'price' => 9.99,
                'description' => 'business Plan',
                'duration' => 'monthly',
                'created_at' => date('Y-m-d H:i:s'),
                'updated_at' => date('Y-m-d H:i:s')
            ],
            [
                'name' => 'Enterprices Plan',
                'price' => 19.99,
                'description' => 'enterprises plan',
                'duration' => 'weekly',
                'created_at' => date('Y-m-d H:i:s'),
                'updated_at' => date('Y-m-d H:i:s')
            ],
            
            ]);
        }
    }
