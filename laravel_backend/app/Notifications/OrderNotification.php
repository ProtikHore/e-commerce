<?php

namespace App\Notifications;

use App\Models\Order;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;
use Illuminate\Notifications\Notification;

class OrderNotification extends Notification implements ShouldQueue
{
    use Queueable;
    private $orderId;
    public function __construct($orderId)
    {
        $this->orderId = $orderId;
    }

    public function via($notifiable)
    {
        return ['mail', 'database'];
    }

    public function toMail($notifiable)
    {
        $order = Order::with('orderDetail', 'orderDetail.product', 'buyer')->where('id', $this->orderId)->first();
        return (new MailMessage)->view('order.mail', ['order' => $order]);
    }

    public function toArray($notifiable)
    {
        return [
            'order_id' => $this->orderId
        ];
    }
}
