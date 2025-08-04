const products = [
  {
    id: 1,
    name: "Organic Aloe Vera Gel",
    category: "skincare",
    price: 299,
    image: "https://via.placeholder.com/250?text=Aloe+Vera+Gel"
  },
  {
    id: 2,
    name: "Rose Water Mist",
    category: "skincare",
    price: 199,
    image: "https://via.placeholder.com/250?text=Rose+Water"
  },
  {
    id: 3,
    name: "Coconut Hair Oil",
    category: "haircare",
    price: 399,
    image: "https://via.placeholder.com/250?text=Coconut+Oil"
  },
  {
    id: 4,
    name: "Herbal Shampoo",
    category: "haircare",
    price: 499,
    image: "https://via.placeholder.com/250?text=Herbal+Shampoo"
  },
  {
    id: 5,
    name: "Lavender Body Lotion",
    category: "bodycare",
    price: 349,
    image: "https://via.placeholder.com/250?text=Lavender+Lotion"
  },
  {
    id: 6,
    name: "Neem Face Pack",
    category: "skincare",
    price: 250,
    image: "https://via.placeholder.com/250?text=Neem+Pack"
  },
  {
    id: 7,
    name: "Mint Foot Cream",
    category: "bodycare",
    price: 299,
    image: "https://via.placeholder.com/250?text=Mint+Foot+Cream"
  },
  {
    id: 8,
    name: "Argan Hair Serum",
    category: "haircare",
    price: 599,
    image: "https://via.placeholder.com/250?text=Argan+Serum"
  },
  {
    id: 9,
    name: "Charcoal Soap Bar",
    category: "bodycare",
    price: 149,
    image: "https://via.placeholder.com/250?text=Charcoal+Soap"
  },
  {
    id: 10,
    name: "Turmeric Face Scrub",
    category: "skincare",
    price: 329,
    image: "https://via.placeholder.com/250?text=Turmeric+Scrub"
  }
];

let cart = [];

function renderProducts(filter) {
  const container = document.getElementById("products");
  if (!container) return;
  container.innerHTML = "";

  const filtered = filter === "all"
    ? products
    : products.filter(p => p.category === filter);

  filtered.forEach(product => {
    const div = document.createElement("div");
    div.className = "product";
    div.innerHTML = `
      <img src="${product.image}" alt="${product.name}">
      <h3>${product.name}</h3>
      <p>₹${product.price}</p>
      <button class="add-to-cart" onclick="addToCart(${product.id})">Add to Cart</button>
    `;
    container.appendChild(div);
  });
}

function addToCart(id) {
  const product = products.find(p => p.id === id);
  if (product) cart.push(product);
  updateCart();
}

function updateCart() {
  document.getElementById("cart-count").textContent = cart.length;
  const cartItems = document.getElementById("cart-items");
  if (!cartItems) return;

  cartItems.innerHTML = "";
  cart.forEach((item, i) => {
    const li = document.createElement("li");
    li.textContent = `${item.name} - ₹${item.price}`;
    cartItems.appendChild(li);
  });
}

function clearCart() {
  cart = [];
  updateCart();
  toggleCart(false);
}

function toggleCart(forceOpen) {
  const cartEl = document.getElementById("cart");
  if (!cartEl) return;

  const isVisible = cartEl.style.display === "block";
  cartEl.style.display = forceOpen === false || isVisible ? "none" : "block";
}


