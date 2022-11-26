<?php

use Illuminate\Database\Seeder;

class SettingTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('settings')->insert([
            [
                'key' => 'paypal_client_id',
                'value' => 'AZ-CXHgvkCckFCrEHfWgQmD3He6R-vjAMeFIzrPuc91YoZQ1wqd31LLHMI4n_ynss7FzHuiOOCed-gew', 
                'created_at' => date('Y-m-d H:i:s'),
                'updated_at' => date('Y-m-d H:i:s')
            ],
            ]);
    }
}
