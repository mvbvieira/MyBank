# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

# Admin User

User.create(email: 'admin@mybank.com', username: 'admin', password: '123456', role: 'admin')

# Create PaymentMethods

PaymentMethod.create(user: User.where(email: 'admin@mybank.com').last, description: 'Credit Card')
