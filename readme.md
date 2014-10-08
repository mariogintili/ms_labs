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

