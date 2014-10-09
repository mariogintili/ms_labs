# Online Shop test

We have decided to open a hyper-focussed online shop that sells 
only three things - jeans, blouses, and socks. Each product has a corresponding 
product code and price.

To try and incentivise customers to spend more with us, the delivery charges are 
staggered. For orders under £50, delivery costs £4.95. For orders under £90, 
delivery costs £2.95. Orders over £90 have free delivery

The final piece of code to write is the basket, which needs to have the following 
interface:

- It is initialised with the products, delivery charge rules, and offers (the format of 
how these are passed is up to you)

- It has an add method that takes the product code as a parameter

- It has a total method that returns the total cost of the basket, taking into 
account the delivery and offer rules


To run the test suite, first ```bundle``` then

```bash
 $ bundle exec rspec -fd
```

If you want to play with the **application's console** set ``CONSOLE`` to ``true``

```bash
 $ CONSOLE=true bundle exec rspec
```

### See it in action

```ruby
def delivery_rules
  ->(total) do
    case 
    when 50.0 > total
      4.95
    when total.between?(50.0, 90.0)
      2.95
    when total > 90
      0.0
    end
  end
end

def offer
  ->(products) { products.map(&:price).inject(:+) / 2.0 }
end

products = [Jeans.new, Socks.new]

order = Order.new products: products, delivery_rules: delivery_rules, offer: offer
=> #<MsLabs::Order:0x000001023cf6d8
 @delivery_rules=#<Proc:0x000001023cf7a0@(pry):29 (lambda)>,
 @offer=#<Proc:0x000001023cf728@(pry):41 (lambda)>,
 @products=[#<MsLabs::Jeans:0x000001025517e0>, #<MsLabs::Socks:0x000001025517b8>]>

 order.total
 => 25.4

```

