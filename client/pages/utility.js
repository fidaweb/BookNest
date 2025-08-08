function createCard(book, clickfunction, action) {
  //create my card

  let card = $(document.createElement("div"));

  // add class card to enforce page specific styling
  card.addClass("card");

  //append child elements to card embedded with data fetched from database
  card.append(
    `<img class="cardimage" loading="lazy"  src="${book["Image_URL_L"]}" alt="${book["Book_Title"]}" style="height: 10rem;">`
  );
  let card2 = $(document.createElement("div"));
  card2.addClass("sinfo");
  card2.append(
    `<h2 class="title" data-bs-toggle="tooltip" data-bs-placement="top" title="${book["Book_Title"]}"  slot="title">${book["Book_Title"]}</h2>`
  );
  card2.append(`<p  class='author' slot="author">${book["Book_Author"]}</p>`);
  card2.append(
    `<p class='desc' >This book is the bestseller with a very interesting story to tell ...</p>`
  );
  card2.append(`<p class='price' slot="price">$${book["PRICE"]}</p>`);
  if (clickfunction !== undefined) {
    card2.append(
      `<button slot="button" class='btn btn-outline-dark' " onclick={${clickfunction}(${book["id"]})}>${action}</button>`
    );
  } else {
    card2.append(
      `<button slot="button" class='btn btn-outline-dark' " onclick={addToCart(${book["id"]})}>Add to Cart</button>`
    );
  }

  card.append(card2);
  return card;
}
//Dark mode icons created by mpanicon - Flaticon
function navbar() {
  $("body").prepend(`<div class="navbar">
    <div class="logo-holder">
      <h2>Book Nest</h2>
    </div>

    <div class="menu">
      <div id='theme_change' class="wrap">
      
    
     
      </div>
      <div class="wrap">
        <a href="home.html">Home</a>
      </div>

      <div class="wrap">
        <a href="blogs.html">Blogs</a>
      </div>
      <div class="wrap">
        <a href="communities.html">Communities</a>
      </div>
    </div>
  </div>`);

  if (
    window.location.href.match("home") ||
    window.location.href.match("history_politics") ||
    window.location.href.match("education") ||
    window.location.href.match("fiction") ||
    window.location.href.match("kids")
  ) {
    $("#theme_change").append(
      `<img onclick="changetheme()" class="payment-logo" src='../assets/night-mode.png'/>`
    );
  }
}

function theme() {
  body = $("body")[0];

  theme_current = localStorage.getItem("theme");
  if (theme_current == "light" || theme_current == undefined) {
    if (theme_current == undefined) {
      localStorage.setItem("theme", "light");
    }
    body.style.background =
      "url('../assets/library1.webp') center/cover no-repeat";
  } else {
    body.style.background =
      "url('../assets/libr3.webp') center/cover no-repeat";
  }
}

function changetheme() {
  theme_temp = localStorage.getItem("theme");
  if (theme_temp == "light") {
    localStorage.setItem("theme", "dark");
  } else {
    localStorage.setItem("theme", "light");
  }
  theme();
}

function footer() {
  $("body").append(`
     <footer class="footer">
      <div class="container py-5">
        <div class="row">
          <div class="col-lg-4 mb-4">
            <h5><i class="fas fa-book"></i> BookNest</h5>
            <p>
              Your trusted online bookstore for all genres. Discover, read, and
              grow with our vast collection of books.
            </p>
            <div class="social-links">
              <a href="https://www.facebook.com/"
                ><i class="fab fa-facebook"></i
              ></a>
              <a href="https://x.com/?lang=en"
                ><i class="fab fa-twitter"></i
              ></a>
              <a href="https://www.instagram.com/"
                ><i class="fab fa-instagram"></i
              ></a>
              <a href="https://www.linkedin.com/"
                ><i class="fab fa-linkedin"></i
              ></a>
            </div>
          </div>
          <div class="col-lg-2 col-md-6 mb-4">
            <h6>Quick Links</h6>
            <ul>
              <li><a href="home.html">Home</a></li>
              <li><a href="communities.html">Communities</a></li>
            </ul>
          </div>

          <div class="col-lg-3 col-md-6 mb-4">
            <h6>Contact Us</h6>
            <p><span>&#9993;</span> Email: booknest@gmail.com</p>
            <p><span>&#9743;</span> Phone: 01824673890</p>
            <p><span>&#8962;</span> Address: Block A Dhaka, Bangladesh</p>
          </div>
        </div>
        <hr style="border-color: #495057" />
        <div class="row align-items-center">
          <div class="col-md-6">
            <p class="mb-0">&copy; 2025 BookNest. All rights reserved.</p>
          </div>
          <div class="col-md-6 text-md-end">
            <img
              src="../assets/images/visa.webp"
              alt="Visa"
              class="payment-logo"
            />
            <img
              src="../assets/images/mastercard.webp"
              alt="Mastercard"
              class="payment-logo"
            />
            <img
              src="../assets/images/bkash.webp"
              alt="Bkash"
              class="payment-logo"
            />
            <img
              src="../assets/images/nagad.webp"
              alt="Nagad"
              class="payment-logo"
            />
            <img
              src="../assets/images/upay.webp"
              alt="Upay"
              class="payment-logo"
            />
          </div>
        </div>
      </div>
    </footer>
    `);
}

function deleteCookie(cname, cvalue, exdays) {
  const d = new Date();
  d.setTime(d.getTime() - exdays * 24 * 60 * 60 * 1000);
  let expires = "expires=" + d.toUTCString();
  // document.cookie = cname + "=" + encodeURIComponent(cvalue) + ";" + expires + ";path=/";
  let temp = cname + "=" + cvalue + ";" + expires + ";path=/";
  console.log(temp);
  document.cookie = temp;
}

function getCookie(cname) {
  cname = cname + "=";
  let cookie = decodeURIComponent(document.cookie).split(";");
  for (let i = 0; i < cookie.length; i++) {
    c = cookie[i];
    while (c.charAt(0) == " ") {
      c = c.substring(1);
    }
    if (c.indexOf(cname) == 0) {
      return c.substring(cname.length, c.length);
    }
  }
  return "";
}

function addToCart(event, bookID) {
  if (getCookie("session_id") != "") {
    //initalize an empty array
    let books = [];
    //check localstorage for array of books
    if (localStorage.getItem("books")) {
      //if found parse the array as it is currently a string into real array
      books = JSON.parse(localStorage.getItem("books"));
    }
    //push the bookid passed as argument into books array
    books.push(bookID);
    //set the mdified array into locla storage again as string
    localStorage.setItem("books", JSON.stringify(books));

    //create new modal based on styled modal above and then show it
    new bootstrap.Modal($("#mymodal")[0]).show();
  } else {
    alert("Login to add to cart");
  }
}
