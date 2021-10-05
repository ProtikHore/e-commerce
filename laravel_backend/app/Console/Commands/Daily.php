<?php

namespace App\Console\Commands;

use App\Models\Delivery;
use App\Models\Order;
use Illuminate\Console\Command;

class Daily extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'daily:move';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Move Delivered order every midnight';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Execute the console command.
     *
     * @return int
     */
    public function handle()
    {
        $orders = Order::where('status', 'Delivered')->get();
        foreach($orders as $order) {
            $deliveryData['order_number'] = $order->order_number;
            $deliveryData['buyer_id'] = $order->buyer_id;
            $deliveryData['status'] = $order->status;
            $deliveryData['description'] = $order->description;
            Delivery::create($deliveryData);
        }
        Order::where('status', 'Delivered')->delete();
        $this->info('Done');
        //return 'Done';
    }
}
