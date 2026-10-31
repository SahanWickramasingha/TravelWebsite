<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Destinations - WonderLanka</title>
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:ital,wght@0,400;0,700;1,400;1,700&family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body { font-family: 'Inter', 'Segoe UI', sans-serif; background: #f0f4f8; }

        /* ===== NAV ===== */
        nav {
            background: rgba(50,50,50,0.97);
            backdrop-filter: blur(20px);
            border-bottom: 1px solid rgba(255,255,255,0.08);
            position: sticky;
            top: 0;
            z-index: 1000;
        }
        .nav-container {
            max-width: 1400px;
            margin: 0 auto;
            padding: 12px 40px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .nav-logo { display: flex; flex-direction: column; text-decoration: none; }
        .nav-logo .logo-text {
            font-family: 'Playfair Display', serif;
            font-style: italic;
            font-size: 28px;
            font-weight: 700;
            color: white;
            letter-spacing: 1px;
            line-height: 1.1;
        }
        .nav-logo .logo-tagline { font-size: 11px; color: rgba(255,255,255,0.5); letter-spacing: 1px; margin-top: 2px; }
        .nav-menu { display: flex; align-items: center; gap: 8px; }
        .nav-menu a {
            color: white; text-decoration: none; font-size: 13px; font-weight: 600;
            letter-spacing: 1.5px; text-transform: uppercase; padding: 8px 14px;
            transition: all 0.3s; position: relative;
        }
        .nav-menu a::after {
            content: ''; position: absolute; bottom: 2px; left: 50%; transform: translateX(-50%);
            width: 0; height: 2px; background: #FFD700; transition: width 0.3s;
        }
        .nav-menu a:hover { color: #FFD700; }
        .nav-menu a:hover::after { width: 60%; }
        .nav-menu a.active-link { color: #FFD700; }
        .nav-menu a.active-link::after { width: 60%; }
        .nav-actions { display: flex; align-items: center; gap: 12px; }
        .nav-inquire-btn {
            background: rgba(255,255,255,0.12); border: 1px solid rgba(255,255,255,0.25);
            color: white; padding: 8px 22px; border-radius: 25px; font-size: 12px;
            font-weight: 700; letter-spacing: 1.2px; text-transform: uppercase;
            text-decoration: none; transition: all 0.3s; display: flex; align-items: center; gap: 6px;
        }
        .nav-inquire-btn:hover { background: #FFD700; color: #000; border-color: #FFD700; }
        .nav-profile-link {
            color: #FFD700; text-decoration: none; font-size: 13px; font-weight: 600;
            display: flex; align-items: center; gap: 5px; transition: all 0.3s;
        }
        .nav-profile-link:hover { color: white; }
        .nav-logout-btn {
            color: rgba(255,255,255,0.6); text-decoration: none; font-size: 12px;
            font-weight: 500; letter-spacing: 1px; text-transform: uppercase; transition: color 0.3s;
        }
        .nav-logout-btn:hover { color: #ff6b6b; }

        /* ===== PAGE HEADER ===== */
        .page-header {
            background: linear-gradient(135deg, #0d4d8a, #1a6b3a);
            color: white; text-align: center; padding: 60px 20px;
            animation: fadeIn 1s ease;
        }
        .page-header h1 { font-family: 'Playfair Display', serif; font-size: 48px; margin-bottom: 10px; }
        .page-header p { font-size: 18px; opacity: 0.9; }
        @keyframes fadeIn { from { opacity: 0; } to { opacity: 1; } }

        /* ===== DESTINATIONS ===== */
        .destinations { padding: 60px 40px; max-width: 1200px; margin: 0 auto; }
        .dest-grid { display: grid; grid-template-columns: repeat(3, 1fr); gap: 30px; }
        .dest-card {
            background: white; border-radius: 15px; overflow: hidden;
            box-shadow: 0 5px 20px rgba(0,0,0,0.1); transition: transform 0.3s, box-shadow 0.3s;
            animation: slideUp 0.8s ease;
        }
        .dest-card:hover { transform: translateY(-10px); box-shadow: 0 20px 40px rgba(0,0,0,0.2); }
        @keyframes slideUp { from { opacity: 0; transform: translateY(30px); } to { opacity: 1; transform: translateY(0); } }
        .dest-img { height: 220px; overflow: hidden; position: relative; }
        .dest-img img { width: 100%; height: 100%; object-fit: cover; transition: transform 0.5s ease; }
        .dest-card:hover .dest-img img { transform: scale(1.1); }
        .dest-img .overlay { position: absolute; bottom: 0; left: 0; width: 100%; background: linear-gradient(transparent, rgba(0,0,0,0.4)); height: 60px; }
        .dest-info { padding: 25px; }
        .dest-info h3 { font-size: 22px; color: #0d4d8a; margin-bottom: 8px; }
        .dest-info p { color: #666; line-height: 1.6; margin-bottom: 15px; }
        .dest-tag { display: inline-block; background: #e8f4fd; color: #0d4d8a; padding: 4px 12px; border-radius: 20px; font-size: 13px; margin-right: 5px; margin-bottom: 5px; }
        .sub-imgs { display: flex; gap: 6px; margin-top: 14px; }
        .sub-img-wrap { position: relative; border-radius: 8px; overflow: hidden; flex: 1; }
        .sub-img-wrap img { width: 100%; height: 65px; object-fit: cover; display: block; transition: transform 0.3s; }
        .sub-img-wrap:hover img { transform: scale(1.08); }
        .sub-label { position: absolute; bottom: 3px; left: 4px; background: rgba(0,0,0,0.65); color: white; font-size: 9px; padding: 2px 5px; border-radius: 4px; }
        .book-btn {
            display: block; text-align: center; margin: 40px auto; background: #FFD700;
            color: #000; padding: 15px 50px; border-radius: 30px; text-decoration: none;
            font-weight: bold; font-size: 18px; width: fit-content; transition: transform 0.3s;
        }
        .book-btn:hover { transform: scale(1.05); }

        /* ===== FOOTER ===== */
        .site-footer { position: relative; color: white; }
        .footer-bg {
            background: linear-gradient(135deg, #0a1a0e 0%, #0d2818 30%, #0a1628 70%, #0d1b2a 100%);
            position: relative;
        }
        .footer-bg::before {
            content: ''; position: absolute; top: 0; left: 0; width: 100%; height: 100%;
            background: url('${pageContext.request.contextPath}/images/ella.jpg') center/cover no-repeat;
            opacity: 0.15; z-index: 0;
        }
        .footer-content {
            position: relative; z-index: 2; max-width: 1200px; margin: 0 auto;
            padding: 70px 40px 50px; display: grid; grid-template-columns: 1fr 1.5fr 1fr; gap: 50px;
        }
        .footer-col h4 { font-size: 13px; font-weight: 700; letter-spacing: 2px; text-transform: uppercase; color: rgba(255,255,255,0.5); margin-bottom: 25px; }
        .footer-col p { color: rgba(255,255,255,0.7); font-size: 14px; line-height: 1.9; margin-bottom: 8px; }
        .footer-col .footer-label { color: rgba(255,255,255,0.4); font-size: 12px; font-weight: 600; letter-spacing: 1.5px; text-transform: uppercase; margin-top: 20px; margin-bottom: 6px; }
        .footer-col a { color: rgba(255,255,255,0.7); text-decoration: none; font-size: 14px; transition: all 0.3s; display: block; padding: 5px 0; }
        .footer-col a:hover { color: #FFD700; padding-left: 5px; }
        .footer-links-grid { display: grid; grid-template-columns: 1fr 1fr; gap: 0 30px; }
        .footer-newsletter-input { display: flex; margin-top: 5px; }
        .footer-newsletter-input input { flex: 1; padding: 12px 18px; background: rgba(255,255,255,0.08); border: 1px solid rgba(255,255,255,0.15); border-right: none; border-radius: 8px 0 0 8px; color: white; font-size: 14px; outline: none; font-family: 'Inter', sans-serif; }
        .footer-newsletter-input input::placeholder { color: rgba(255,255,255,0.3); }
        .footer-newsletter-input button { padding: 12px 20px; background: #FFD700; border: none; border-radius: 0 8px 8px 0; color: #000; font-weight: 700; cursor: pointer; font-size: 16px; transition: background 0.3s; }
        .footer-newsletter-input button:hover { background: #FFA500; }
        .footer-payment { display: flex; gap: 8px; margin-top: 20px; flex-wrap: wrap; }
        .payment-icon { background: rgba(255,255,255,0.1); border: 1px solid rgba(255,255,255,0.15); padding: 5px 10px; border-radius: 4px; font-size: 12px; font-weight: 700; color: white; }
        .footer-social { display: flex; gap: 12px; margin-top: 20px; }
        .footer-social a { display: flex; align-items: center; justify-content: center; width: 36px; height: 36px; border-radius: 50%; background: rgba(255,255,255,0.08); border: 1px solid rgba(255,255,255,0.12); color: white; font-size: 16px; text-decoration: none; transition: all 0.3s; padding: 0; }
        .footer-social a:hover { background: #FFD700; color: #000; border-color: #FFD700; transform: translateY(-3px); }
        .footer-bottom { position: relative; z-index: 2; border-top: 1px solid rgba(255,255,255,0.08); padding: 20px 40px; display: flex; justify-content: space-between; align-items: center; max-width: 1200px; margin: 0 auto; flex-wrap: wrap; gap: 10px; }
        .footer-bottom p { color: rgba(255,255,255,0.35); font-size: 13px; }
        .footer-bottom-links { display: flex; gap: 20px; }
        .footer-bottom-links a { color: rgba(255,255,255,0.35); text-decoration: none; font-size: 13px; transition: color 0.3s; }
        .footer-bottom-links a:hover { color: #FFD700; }

        @media (max-width: 768px) {
            .nav-menu { display: none; }
            .dest-grid { grid-template-columns: 1fr; }
            .footer-content { grid-template-columns: 1fr; gap: 30px; }
        }
    </style>
</head>
<body>

<!-- NAV -->
<nav>
    <div class="nav-container">
        <a href="${pageContext.request.contextPath}/home" class="nav-logo">
            <span class="logo-text">WonderLanka</span>
        </a>
        <div class="nav-menu">
            <a href="${pageContext.request.contextPath}/home">HOME</a>
            <a href="${pageContext.request.contextPath}/destinations" class="active-link">DESTINATIONS</a>
            <a href="${pageContext.request.contextPath}/booking">BOOK NOW</a>
            <a href="${pageContext.request.contextPath}/contact">CONTACT</a>
        </div>
        <div class="nav-actions">
            <% if (session.getAttribute("userLoggedIn") != null) { %>
                <a href="${pageContext.request.contextPath}/profile" class="nav-profile-link">👤 <%= session.getAttribute("userName") %></a>
                <a href="${pageContext.request.contextPath}/logout" class="nav-logout-btn">LOGOUT</a>
            <% } else { %>
                <a href="${pageContext.request.contextPath}/login" class="nav-inquire-btn">🔑 SIGN IN</a>
            <% } %>
        </div>
    </div>
</nav>

<div class="page-header">
    <h1>🌍 Our Destinations</h1>
    <p>Explore the most beautiful places in Sri Lanka</p>
</div>

<div class="destinations">
    <div class="dest-grid">
        <!-- Sigiriya -->
        <div class="dest-card">
            <div class="dest-img">
                <img src="${pageContext.request.contextPath}/images/sigiriya.jpeg" alt="Sigiriya" style="object-position: center;">
                <div class="overlay"></div>
            </div>
            <div class="dest-info">
                <h3>🦁 Sigiriya</h3>
                <p>Ancient rock fortress with stunning frescoes and panoramic views. A UNESCO World Heritage Site.</p>
                <span class="dest-tag">Heritage</span><span class="dest-tag">Adventure</span>
            </div>
        </div>
        <!-- Galle Fort -->
        <div class="dest-card">
            <div class="dest-img">
                <img src="${pageContext.request.contextPath}/images/galle.jpg" alt="Galle Fort" style="object-position: center;">
                <div class="overlay"></div>
            </div>
            <div class="dest-info">
                <h3>🏰 Galle Fort</h3>
                <p>A historic Dutch colonial fort with charming streets, boutiques and ocean views.</p>
                <span class="dest-tag">History</span><span class="dest-tag">Culture</span>
                <div class="sub-imgs">
                    <div class="sub-img-wrap"><img src="${pageContext.request.contextPath}/images/galle2.jpg" alt="Galle 2"><span class="sub-label">Fort Streets</span></div>
                    <div class="sub-img-wrap"><img src="${pageContext.request.contextPath}/images/galle3.jpg" alt="Galle 3"><span class="sub-label">Ocean View</span></div>
                </div>
            </div>
        </div>
        <!-- Kandy -->
        <div class="dest-card">
            <div class="dest-img">
                <img src="${pageContext.request.contextPath}/images/kandy.jpg" alt="Kandy" style="object-position: center;">
                <div class="overlay"></div>
            </div>
            <div class="dest-info">
                <h3>🕌 Kandy</h3>
                <p>Cultural capital of Sri Lanka, home to the sacred Temple of the Tooth Relic.</p>
                <span class="dest-tag">Culture</span><span class="dest-tag">Religion</span>
                <div class="sub-imgs">
                    <div class="sub-img-wrap"><img src="${pageContext.request.contextPath}/images/kandy2.jpg" alt="Kandy 2"><span class="sub-label">Kandy Lake</span></div>
                </div>
            </div>
        </div>
        <!-- Yala -->
        <div class="dest-card">
            <div class="dest-img">
                <img src="${pageContext.request.contextPath}/images/yala.jpg" alt="Yala National Park" style="object-position: center 20%;">
                <div class="overlay"></div>
            </div>
            <div class="dest-info">
                <h3>🐆 Yala National Park</h3>
                <p>World's highest density of leopards. Amazing wildlife safari experience.</p>
                <span class="dest-tag">Wildlife</span><span class="dest-tag">Safari</span>
            </div>
        </div>
        <!-- Ella -->
        <div class="dest-card">
            <div class="dest-img">
                <img src="${pageContext.request.contextPath}/images/ella.jpg" alt="Ella" style="object-position: center;">
                <div class="overlay"></div>
            </div>
            <div class="dest-info">
                <h3>🚂 Ella</h3>
                <p>Scenic hill town with tea plantations, waterfalls and the famous Nine Arch Bridge.</p>
                <span class="dest-tag">Nature</span><span class="dest-tag">Hiking</span>
            </div>
        </div>
        <!-- Mirissa -->
        <div class="dest-card">
            <div class="dest-img">
                <img src="${pageContext.request.contextPath}/images/mirissa.jpg" alt="Mirissa" style="object-position: center;">
                <div class="overlay"></div>
            </div>
            <div class="dest-info">
                <h3>🐋 Mirissa</h3>
                <p>Beautiful beach destination famous for whale watching and stunning sunsets.</p>
                <span class="dest-tag">Beach</span><span class="dest-tag">Marine</span>
                <div class="sub-imgs">
                    <div class="sub-img-wrap"><img src="${pageContext.request.contextPath}/images/mirissa2.jpg" alt="Mirissa 2"><span class="sub-label">Whale Watching</span></div>
                    <div class="sub-img-wrap"><img src="${pageContext.request.contextPath}/images/mirissa3.jpg" alt="Mirissa 3"><span class="sub-label">Coconut Tree Hill</span></div>
                </div>
            </div>
        </div>
    </div>
    <a href="${pageContext.request.contextPath}/booking" class="book-btn">✈ Book Your Trip Now</a>
</div>

<!-- FOOTER -->
<div class="site-footer">
    <div class="footer-bg">
        <div class="footer-content">
            <div class="footer-col">
                <h4>Address</h4>
                <p>WonderLanka Travels (Pvt) Ltd,<br>No 45, Galle Road,<br>Colombo 03, Sri Lanka.</p>
                <div class="footer-label">Phone</div><p>+94 11 234 5678</p>
                <div class="footer-label">Email</div><p>info@wonderlanka.com</p>
            </div>
            <div class="footer-col">
                <h4>Quick Links</h4>
                <div class="footer-links-grid">
                    <div>
                        <a href="${pageContext.request.contextPath}/home">Home</a>
                        <a href="${pageContext.request.contextPath}/destinations">Destinations</a>
                        <a href="${pageContext.request.contextPath}/booking">Book Now</a>
                        <a href="${pageContext.request.contextPath}/contact">Contact Us</a>
                    </div>
                    <div>
                        <a href="#">Sri Lanka Tours</a><a href="#">Sri Lanka Guide</a>
                        <a href="#">Special Offers</a><a href="#">Reviews</a>
                    </div>
                </div>
            </div>
            <div class="footer-col">
                <h4>Newsletter</h4>
                <div class="footer-newsletter-input"><input type="email" placeholder="Enter your email address"><button>➤</button></div>
                <div class="footer-label">Our Payment Partners</div>
                <div class="footer-payment"><span class="payment-icon">VISA</span><span class="payment-icon">MC</span><span class="payment-icon">AMEX</span><span class="payment-icon">PayPal</span></div>
                <div class="footer-social"><a href="#">f</a><a href="#">📷</a><a href="#">▶</a><a href="#">in</a><a href="#">🎵</a></div>
            </div>
        </div>
        <div class="footer-bottom">
            <p>© 2026 WonderLanka Travels. All rights reserved.</p>
            <div class="footer-bottom-links"><a href="#">Terms & Conditions</a><a href="#">Privacy Policy</a><a href="#">Sitemap</a></div>
        </div>
    </div>
</div>

</body>
</html>