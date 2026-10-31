<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>WonderLanka Travels</title>
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:ital,wght@0,400;0,700;1,400;1,700&family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body { font-family: 'Inter', 'Segoe UI', sans-serif; }

        /* ===== WALKER'S TOURS STYLE NAV ===== */
        nav {
            position: fixed;
            width: 100%;
            top: 0;
            z-index: 1000;
            background: rgba(45, 45, 45, 0.85);
            backdrop-filter: blur(8px);
            transition: all 0.4s ease;
            border-bottom: 1px solid rgba(255,255,255,0.08);
        }
        nav.scrolled {
            background: rgba(50, 50, 50, 0.97);
            backdrop-filter: blur(20px);
            box-shadow: 0 4px 30px rgba(0,0,0,0.3);
        }
        .nav-container {
            max-width: 1400px;
            margin: 0 auto;
            padding: 12px 40px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .nav-logo {
            display: flex;
            flex-direction: column;
        }
        .nav-logo .logo-text {
            font-family: 'Playfair Display', serif;
            font-style: italic;
            font-size: 28px;
            font-weight: 700;
            color: white;
            letter-spacing: 1px;
            line-height: 1.1;
        }
        .nav-logo .logo-tagline {
            font-size: 11px;
            color: rgba(255,255,255,0.5);
            letter-spacing: 1px;
            margin-top: 2px;
        }
        .nav-menu {
            display: flex;
            align-items: center;
            gap: 8px;
        }
        .nav-menu a {
            color: white;
            text-decoration: none;
            font-size: 13px;
            font-weight: 600;
            letter-spacing: 1.5px;
            text-transform: uppercase;
            padding: 8px 14px;
            transition: all 0.3s;
            position: relative;
        }
        .nav-menu a::after {
            content: '';
            position: absolute;
            bottom: 2px;
            left: 50%;
            transform: translateX(-50%);
            width: 0;
            height: 2px;
            background: #FFD700;
            transition: width 0.3s;
        }
        .nav-menu a:hover { color: #FFD700; }
        .nav-menu a:hover::after { width: 60%; }
        .nav-menu a.active-link { color: #FFD700; }
        .nav-menu a.active-link::after { width: 60%; }

        .nav-actions {
            display: flex;
            align-items: center;
            gap: 12px;
        }
        .nav-search-btn {
            background: none;
            border: none;
            color: white;
            font-size: 18px;
            cursor: pointer;
            padding: 8px;
            transition: color 0.3s;
        }
        .nav-search-btn:hover { color: #FFD700; }
        .nav-inquire-btn {
            background: rgba(255,255,255,0.12);
            border: 1px solid rgba(255,255,255,0.25);
            color: white;
            padding: 8px 22px;
            border-radius: 25px;
            font-size: 12px;
            font-weight: 700;
            letter-spacing: 1.2px;
            text-transform: uppercase;
            text-decoration: none;
            transition: all 0.3s;
            display: flex;
            align-items: center;
            gap: 6px;
        }
        .nav-inquire-btn:hover {
            background: #FFD700;
            color: #000;
            border-color: #FFD700;
        }
        .nav-profile-link {
            color: #FFD700;
            text-decoration: none;
            font-size: 13px;
            font-weight: 600;
            letter-spacing: 0.5px;
            display: flex;
            align-items: center;
            gap: 5px;
            transition: all 0.3s;
        }
        .nav-profile-link:hover { color: white; }
        .nav-logout-btn {
            color: rgba(255,255,255,0.6);
            text-decoration: none;
            font-size: 12px;
            font-weight: 500;
            letter-spacing: 1px;
            text-transform: uppercase;
            transition: color 0.3s;
        }
        .nav-logout-btn:hover { color: #ff6b6b; }

        /* ===== HERO ===== */
        .hero {
            height: 100vh;
            position: relative;
            overflow: hidden;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            text-align: center;
            color: white;
        }
        .hero-video {
            position: absolute;
            top: 50%; left: 50%;
            transform: translate(-50%, -50%);
            min-width: 100%; min-height: 100%;
            width: auto; height: auto;
            object-fit: cover;
            z-index: 0;
        }
        .hero-overlay {
            position: absolute;
            top: 0; left: 0;
            width: 100%; height: 100%;
            background: rgba(0,0,0,0.3);
            z-index: 1;
        }
        .hero-content { position: relative; z-index: 2; }
        .hero-content h1 {
            font-family: 'Playfair Display', serif;
            font-size: 72px;
            animation: fadeInDown 1s ease;
            text-shadow: 2px 2px 8px rgba(0,0,0,0.5);
            letter-spacing: 2px;
        }
        .hero-content p {
            font-size: 22px;
            margin: 20px 0 40px;
            animation: fadeInUp 1.2s ease;
            text-shadow: 1px 1px 4px rgba(0,0,0,0.5);
            font-weight: 300;
            letter-spacing: 1px;
        }
        .scroll-indicator {
            position: absolute;
            bottom: 30px;
            left: 50%;
            transform: translateX(-50%);
            z-index: 2;
            animation: bounce 2s infinite;
            color: white;
            font-size: 30px;
        }
        @keyframes bounce {
            0%, 100% { transform: translateX(-50%) translateY(0); }
            50% { transform: translateX(-50%) translateY(10px); }
        }
        @keyframes fadeInDown {
            from { opacity:0; transform:translateY(-60px); }
            to   { opacity:1; transform:translateY(0); }
        }
        @keyframes fadeInUp {
            from { opacity:0; transform:translateY(60px); }
            to   { opacity:1; transform:translateY(0); }
        }
        .btn {
            background: #FFD700;
            color: #000;
            padding: 16px 45px;
            border-radius: 30px;
            text-decoration: none;
            font-weight: 700;
            font-size: 16px;
            letter-spacing: 1px;
            text-transform: uppercase;
            transition: transform 0.3s, box-shadow 0.3s;
            animation: fadeInUp 1.4s ease;
            display: inline-block;
        }
        .btn:hover {
            transform: scale(1.08);
            box-shadow: 0 8px 25px rgba(255,215,0,0.5);
        }

        /* ===== STATS ===== */
        .stats {
            background: #0d4d8a;
            color: white;
            display: flex;
            justify-content: center;
            gap: 60px;
            padding: 50px 40px;
            flex-wrap: wrap;
        }
        .stat-item { text-align: center; }
        .stat-item h3 { font-size: 48px; color: #FFD700; font-weight: bold; }
        .stat-item p { font-size: 16px; opacity: 0.9; margin-top: 5px; }

        /* ===== FEATURES ===== */
        .features {
            padding: 80px 40px;
            background: #f9f9f9;
            text-align: center;
        }
        .features h2 { font-family: 'Playfair Display', serif; font-size: 42px; margin-bottom: 15px; color: #333; }
        .features .subtitle { color: #888; font-size: 18px; margin-bottom: 50px; }
        .cards { display: flex; justify-content: center; gap: 30px; flex-wrap: wrap; }
        .card {
            background: white;
            border-radius: 20px;
            padding: 40px 30px;
            width: 260px;
            box-shadow: 0 5px 20px rgba(0,0,0,0.08);
            transition: transform 0.3s, box-shadow 0.3s;
            border-bottom: 4px solid transparent;
        }
        .card:hover {
            transform: translateY(-12px);
            box-shadow: 0 20px 40px rgba(0,0,0,0.15);
            border-bottom: 4px solid #FFD700;
        }
        .card .icon { font-size: 55px; margin-bottom: 20px; }
        .card h3 { font-size: 22px; color: #0d4d8a; margin-bottom: 12px; }
        .card p { color: #666; line-height: 1.7; }

        /* ===== TESTIMONIALS ===== */
        .testimonial {
            background: linear-gradient(135deg, #1a6b3a, #0d4d8a);
            color: white;
            text-align: center;
            padding: 80px 40px;
        }
        .testimonial h2 { font-family: 'Playfair Display', serif; font-size: 38px; margin-bottom: 50px; }
        .testimonial-cards { display: flex; justify-content: center; gap: 30px; flex-wrap: wrap; }
        .t-card {
            background: rgba(255,255,255,0.1);
            backdrop-filter: blur(10px);
            border-radius: 20px;
            padding: 35px;
            width: 300px;
            border: 1px solid rgba(255,255,255,0.2);
            transition: transform 0.3s;
        }
        .t-card:hover { transform: translateY(-8px); }
        .t-card p { font-size: 15px; line-height: 1.8; opacity: 0.9; margin-bottom: 20px; }
        .t-card .author { font-weight: bold; color: #FFD700; }
        .stars { font-size: 20px; margin-bottom: 15px; }

        /* ===== WALKER'S TOURS STYLE FOOTER ===== */
        .site-footer {
            position: relative;
            color: white;
        }
        .footer-bg {
            background: linear-gradient(135deg, #0a1a0e 0%, #0d2818 30%, #0a1628 70%, #0d1b2a 100%);
            position: relative;
        }
        .footer-bg::before {
            content: '';
            position: absolute;
            top: 0; left: 0;
            width: 100%; height: 100%;
            background: url('${pageContext.request.contextPath}/images/ella.jpg') center/cover no-repeat;
            opacity: 0.15;
            z-index: 0;
        }
        .footer-content {
            position: relative;
            z-index: 2;
            max-width: 1200px;
            margin: 0 auto;
            padding: 70px 40px 50px;
            display: grid;
            grid-template-columns: 1fr 1.5fr 1fr;
            gap: 50px;
        }
        .footer-col h4 {
            font-size: 13px;
            font-weight: 700;
            letter-spacing: 2px;
            text-transform: uppercase;
            color: rgba(255,255,255,0.5);
            margin-bottom: 25px;
        }
        .footer-col p {
            color: rgba(255,255,255,0.7);
            font-size: 14px;
            line-height: 1.9;
            margin-bottom: 8px;
        }
        .footer-col .footer-label {
            color: rgba(255,255,255,0.4);
            font-size: 12px;
            font-weight: 600;
            letter-spacing: 1.5px;
            text-transform: uppercase;
            margin-top: 20px;
            margin-bottom: 6px;
        }
        .footer-col a {
            color: rgba(255,255,255,0.7);
            text-decoration: none;
            font-size: 14px;
            transition: all 0.3s;
            display: block;
            padding: 5px 0;
        }
        .footer-col a:hover { color: #FFD700; padding-left: 5px; }
        .footer-links-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 0 30px;
        }
        .footer-newsletter-input {
            display: flex;
            margin-top: 5px;
        }
        .footer-newsletter-input input {
            flex: 1;
            padding: 12px 18px;
            background: rgba(255,255,255,0.08);
            border: 1px solid rgba(255,255,255,0.15);
            border-right: none;
            border-radius: 8px 0 0 8px;
            color: white;
            font-size: 14px;
            outline: none;
            font-family: 'Inter', sans-serif;
        }
        .footer-newsletter-input input::placeholder { color: rgba(255,255,255,0.3); }
        .footer-newsletter-input input:focus { border-color: rgba(255,215,0,0.4); }
        .footer-newsletter-input button {
            padding: 12px 20px;
            background: #FFD700;
            border: none;
            border-radius: 0 8px 8px 0;
            color: #000;
            font-weight: 700;
            cursor: pointer;
            font-size: 16px;
            transition: background 0.3s;
        }
        .footer-newsletter-input button:hover { background: #FFA500; }
        .footer-payment {
            display: flex;
            gap: 8px;
            margin-top: 20px;
            flex-wrap: wrap;
        }
        .payment-icon {
            background: rgba(255,255,255,0.1);
            border: 1px solid rgba(255,255,255,0.15);
            padding: 5px 10px;
            border-radius: 4px;
            font-size: 12px;
            font-weight: 700;
            color: white;
        }
        .footer-social {
            display: flex;
            gap: 12px;
            margin-top: 20px;
        }
        .footer-social a {
            display: flex;
            align-items: center;
            justify-content: center;
            width: 36px;
            height: 36px;
            border-radius: 50%;
            background: rgba(255,255,255,0.08);
            border: 1px solid rgba(255,255,255,0.12);
            color: white;
            font-size: 16px;
            text-decoration: none;
            transition: all 0.3s;
            padding: 0;
        }
        .footer-social a:hover {
            background: #FFD700;
            color: #000;
            border-color: #FFD700;
            transform: translateY(-3px);
        }
        .footer-bottom {
            position: relative;
            z-index: 2;
            border-top: 1px solid rgba(255,255,255,0.08);
            padding: 20px 40px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            max-width: 1200px;
            margin: 0 auto;
            flex-wrap: wrap;
            gap: 10px;
        }
        .footer-bottom p {
            color: rgba(255,255,255,0.35);
            font-size: 13px;
        }
        .footer-bottom-links {
            display: flex;
            gap: 20px;
        }
        .footer-bottom-links a {
            color: rgba(255,255,255,0.35);
            text-decoration: none;
            font-size: 13px;
            transition: color 0.3s;
        }
        .footer-bottom-links a:hover { color: #FFD700; }

        /* Responsive */
        @media (max-width: 768px) {
            .nav-menu { display: none; }
            .footer-content { grid-template-columns: 1fr; gap: 30px; }
            .footer-bottom { flex-direction: column; text-align: center; }
            .hero-content h1 { font-size: 40px; }
        }
    </style>
</head>
<body>

<!-- ===== NAVIGATION BAR ===== -->
<nav id="mainNav">
    <div class="nav-container">
        <a href="${pageContext.request.contextPath}/home" class="nav-logo" style="text-decoration:none;">
            <span class="logo-text">WonderLanka</span>
        </a>
        <div class="nav-menu">
            <a href="${pageContext.request.contextPath}/home" class="active-link">HOME</a>
            <a href="${pageContext.request.contextPath}/destinations">DESTINATIONS</a>
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

<!-- ===== HERO ===== -->
<div class="hero">
    <video class="hero-video" autoplay muted loop playsinline
           onerror="this.style.display='none'; document.querySelector('.hero').style.background='linear-gradient(135deg, #1a6b3a, #0d4d8a)'">
        <source src="${pageContext.request.contextPath}/images/srilanka.mp4" type="video/mp4">
    </video>
    <div class="hero-overlay"></div>
    <div class="hero-content">
        <h1>Discover Sri Lanka</h1>
        <p>Experience the Beauty, Culture & Adventure</p>
        <a href="${pageContext.request.contextPath}/destinations" class="btn">✈ Explore Destinations</a>
    </div>
    <div class="scroll-indicator">⬇</div>
</div>

<!-- ===== STATS ===== -->
<div class="stats">
    <div class="stat-item"><h3>500+</h3><p>Happy Travelers</p></div>
    <div class="stat-item"><h3>6+</h3><p>Destinations</p></div>
    <div class="stat-item"><h3>10+</h3><p>Years Experience</p></div>
    <div class="stat-item"><h3>4.9⭐</h3><p>Average Rating</p></div>
</div>

<!-- ===== FEATURES ===== -->
<div class="features">
    <h2>Why Choose Us?</h2>
    <p class="subtitle">We make your Sri Lanka experience unforgettable</p>
    <div class="cards">
        <div class="card"><div class="icon">🏖️</div><h3>Beach Getaways</h3><p>Relax on stunning golden beaches with crystal clear waters.</p></div>
        <div class="card"><div class="icon">🏔️</div><h3>Hill Country</h3><p>Explore misty mountains and scenic tea plantations.</p></div>
        <div class="card"><div class="icon">🐘</div><h3>Wildlife Tours</h3><p>Encounter elephants, leopards and exotic birds up close.</p></div>
        <div class="card"><div class="icon">🏛️</div><h3>Ancient Culture</h3><p>Visit ancient temples, ruins and UNESCO heritage sites.</p></div>
    </div>
</div>

<!-- ===== TESTIMONIALS ===== -->
<div class="testimonial">
    <h2>💬 What Our Travelers Say</h2>
    <div class="testimonial-cards">
        <div class="t-card">
            <div class="stars">⭐⭐⭐⭐⭐</div>
            <p>"WonderLanka made our trip absolutely magical. The Sigiriya experience was breathtaking!"</p>
            <div class="author">— Sarah Johnson, UK</div>
        </div>
        <div class="t-card">
            <div class="stars">⭐⭐⭐⭐⭐</div>
            <p>"Best travel experience ever! The whale watching in Mirissa was once in a lifetime."</p>
            <div class="author">— David Chen, Australia</div>
        </div>
        <div class="t-card">
            <div class="stars">⭐⭐⭐⭐</div>
            <p>"Amazing service and beautiful destinations. Sri Lanka is truly a paradise island!"</p>
            <div class="author">— Priya Kumar, India</div>
        </div>
    </div>
</div>

<!-- ===== WALKER'S TOURS STYLE FOOTER ===== -->
<div class="site-footer">
    <div class="footer-bg">
        <div class="footer-content">
            <!-- Column 1: Address -->
            <div class="footer-col">
                <h4>Address</h4>
                <p>WonderLanka Travels (Pvt) Ltd,<br>No 45, Galle Road,<br>Colombo 03, Sri Lanka.</p>
                <div class="footer-label">Phone</div>
                <p>+94 11 234 5678</p>
                <div class="footer-label">Email</div>
                <p>info@WonderLanka.com</p>
            </div>
            <!-- Column 2: Quick Links -->
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
                        <a href="#">Sri Lanka Tours</a>
                        <a href="#">Sri Lanka Guide</a>
                        <a href="#">Special Offers</a>
                        <a href="#">Reviews</a>
                    </div>
                </div>
            </div>
            <!-- Column 3: Newsletter -->
            <div class="footer-col">
                <h4>Newsletter</h4>
                <div class="footer-newsletter-input">
                    <input type="email" placeholder="Enter your email address">
                    <button>➤</button>
                </div>
                <div class="footer-label">Our Payment Partners</div>
                <div class="footer-payment">
                    <span class="payment-icon">VISA</span>
                    <span class="payment-icon">MC</span>
                    <span class="payment-icon">AMEX</span>
                    <span class="payment-icon">PayPal</span>
                </div>
                <div class="footer-social">
                    <a href="#">f</a>
                    <a href="#">📷</a>
                    <a href="#">▶</a>
                    <a href="#">in</a>
                    <a href="#">🎵</a>
                </div>
            </div>
        </div>
        <div class="footer-bottom">
            <p>© 2026 WonderLanka Travels. All rights reserved.</p>
            <div class="footer-bottom-links">
                <a href="#">Terms & Conditions</a>
                <a href="#">Privacy Policy</a>
                <a href="#">Sitemap</a>
            </div>
        </div>
    </div>
</div>

<script>
    // Scroll-aware nav background
    window.addEventListener('scroll', function() {
        var nav = document.getElementById('mainNav');
        if (window.scrollY > 80) {
            nav.classList.add('scrolled');
        } else {
            nav.classList.remove('scrolled');
        }
    });
</script>

</body>
</html>