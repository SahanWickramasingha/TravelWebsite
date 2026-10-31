<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // Session data ගන්නවා
    String userName = (String) session.getAttribute("userName");
    String userEmail = (String) session.getAttribute("userEmail");
    if (userName == null) userName = "Guest";
    if (userEmail == null) userEmail = "N/A";
    
    // Join date (session creation time use කරනවා)
    java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("MMMM dd, yyyy");
    String joinDate = sdf.format(new java.util.Date(session.getCreationTime()));
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>My Profile - WonderLanka</title>
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:ital,wght@0,400;0,700;1,400;1,700&family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body {
            font-family: 'Inter', 'Segoe UI', sans-serif;
            background: #0a1628;
            min-height: 100vh;
            color: white;
        }

        /* Nav */
        nav {
            background: rgba(50,50,50,0.97);
            padding: 15px 40px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            backdrop-filter: blur(20px);
            border-bottom: 1px solid rgba(255,215,0,0.1);
            position: sticky;
            top: 0;
            z-index: 100;
        }
        nav .logo { color: #FFD700; font-size: 24px; font-weight: 800; letter-spacing: 1px; }
        nav .nav-links a {
            color: rgba(255,255,255,0.8);
            text-decoration: none;
            margin-left: 25px;
            font-weight: 500;
            font-size: 15px;
            transition: all 0.3s;
        }
        nav .nav-links a:hover { color: #FFD700; }
        .nav-user {
            display: flex;
            align-items: center;
            gap: 15px;
        }
        .nav-avatar {
            width: 36px;
            height: 36px;
            border-radius: 50%;
            background: linear-gradient(135deg, #FFD700, #FFA500);
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: 800;
            font-size: 14px;
            color: #000;
        }
        .nav-user-name {
            color: #FFD700;
            font-weight: 600;
            font-size: 14px;
        }
        .logout-btn {
            background: rgba(255,59,48,0.15);
            border: 1px solid rgba(255,59,48,0.3);
            color: #ff6b6b;
            padding: 8px 18px;
            border-radius: 8px;
            text-decoration: none;
            font-size: 13px;
            font-weight: 600;
            transition: all 0.3s;
        }
        .logout-btn:hover {
            background: rgba(255,59,48,0.3);
            transform: translateY(-1px);
        }

        /* Profile Header */
        .profile-header {
            background: linear-gradient(135deg, #0d4d8a 0%, #1a6b3a 50%, #0d4d8a 100%);
            padding: 60px 40px 80px;
            text-align: center;
            position: relative;
            overflow: hidden;
        }
        .profile-header::before {
            content: '';
            position: absolute;
            top: 0; left: 0;
            width: 100%; height: 100%;
            background: url("data:image/svg+xml,%3Csvg width='60' height='60' viewBox='0 0 60 60' xmlns='http://www.w3.org/2000/svg'%3E%3Cg fill='none' fill-rule='evenodd'%3E%3Cg fill='%23ffffff' fill-opacity='0.03'%3E%3Cpath d='M36 34v-4h-2v4h-4v2h4v4h2v-4h4v-2h-4zm0-30V0h-2v4h-4v2h4v4h2V6h4V4h-4zM6 34v-4H4v4H0v2h4v4h2v-4h4v-2H6zM6 4V0H4v4H0v2h4v4h2V6h4V4H6z'/%3E%3C/g%3E%3C/g%3E%3C/svg%3E");
        }
        .profile-avatar {
            width: 120px;
            height: 120px;
            border-radius: 50%;
            background: linear-gradient(135deg, #FFD700, #FFA500);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 48px;
            font-weight: 800;
            color: #000;
            margin: 0 auto 20px;
            border: 4px solid rgba(255,255,255,0.2);
            box-shadow: 0 10px 40px rgba(0,0,0,0.3);
            position: relative;
            z-index: 2;
            animation: scaleIn 0.6s cubic-bezier(0.22, 1, 0.36, 1);
        }
        @keyframes scaleIn {
            from { transform: scale(0.5); opacity: 0; }
            to { transform: scale(1); opacity: 1; }
        }
        .profile-header h1 {
            font-size: 32px;
            font-weight: 800;
            position: relative;
            z-index: 2;
            animation: fadeInUp 0.6s ease 0.2s both;
        }
        .profile-header .email {
            color: rgba(255,255,255,0.7);
            font-size: 15px;
            margin-top: 8px;
            position: relative;
            z-index: 2;
            animation: fadeInUp 0.6s ease 0.3s both;
        }
        .profile-header .member-badge {
            display: inline-flex;
            align-items: center;
            gap: 6px;
            background: rgba(255,215,0,0.15);
            border: 1px solid rgba(255,215,0,0.3);
            padding: 6px 16px;
            border-radius: 20px;
            font-size: 13px;
            color: #FFD700;
            margin-top: 15px;
            position: relative;
            z-index: 2;
            animation: fadeInUp 0.6s ease 0.4s both;
        }
        @keyframes fadeInUp {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        /* Main Content */
        .profile-content {
            max-width: 1100px;
            margin: -40px auto 60px;
            padding: 0 20px;
            position: relative;
            z-index: 5;
        }

        /* Stats Cards */
        .stats-grid {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 20px;
            margin-bottom: 30px;
        }
        .stat-card {
            background: rgba(255,255,255,0.05);
            border: 1px solid rgba(255,255,255,0.08);
            border-radius: 20px;
            padding: 28px 24px;
            text-align: center;
            backdrop-filter: blur(10px);
            transition: all 0.3s cubic-bezier(0.22, 1, 0.36, 1);
            animation: slideUp 0.6s ease both;
        }
        .stat-card:nth-child(1) { animation-delay: 0.1s; }
        .stat-card:nth-child(2) { animation-delay: 0.2s; }
        .stat-card:nth-child(3) { animation-delay: 0.3s; }
        .stat-card:nth-child(4) { animation-delay: 0.4s; }
        @keyframes slideUp {
            from { opacity: 0; transform: translateY(30px); }
            to { opacity: 1; transform: translateY(0); }
        }
        .stat-card:hover {
            transform: translateY(-5px);
            background: rgba(255,255,255,0.08);
            border-color: rgba(255,215,0,0.2);
        }
        .stat-icon {
            font-size: 36px;
            margin-bottom: 12px;
        }
        .stat-number {
            font-size: 36px;
            font-weight: 800;
            color: #FFD700;
            line-height: 1;
            margin-bottom: 6px;
        }
        .stat-label {
            font-size: 13px;
            color: rgba(255,255,255,0.5);
            font-weight: 500;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        /* Content Grid */
        .content-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 25px;
        }

        /* Glass Card */
        .glass-card {
            background: rgba(255,255,255,0.05);
            border: 1px solid rgba(255,255,255,0.08);
            border-radius: 20px;
            padding: 30px;
            backdrop-filter: blur(10px);
            animation: slideUp 0.6s ease 0.5s both;
        }
        .glass-card h3 {
            font-size: 18px;
            font-weight: 700;
            margin-bottom: 22px;
            display: flex;
            align-items: center;
            gap: 10px;
            color: white;
        }
        .glass-card h3 span { font-size: 22px; }

        /* Account Details */
        .detail-row {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 14px 0;
            border-bottom: 1px solid rgba(255,255,255,0.06);
        }
        .detail-row:last-child { border-bottom: none; }
        .detail-label {
            color: rgba(255,255,255,0.5);
            font-size: 14px;
            font-weight: 500;
        }
        .detail-value {
            color: white;
            font-size: 14px;
            font-weight: 600;
        }
        .detail-badge {
            background: rgba(26,107,58,0.3);
            color: #4ade80;
            padding: 4px 12px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 600;
        }

        /* Recent Bookings Table */
        .bookings-table {
            width: 100%;
            border-collapse: collapse;
        }
        .bookings-table th {
            text-align: left;
            padding: 12px 10px;
            color: rgba(255,255,255,0.4);
            font-size: 12px;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 1px;
            border-bottom: 1px solid rgba(255,255,255,0.08);
        }
        .bookings-table td {
            padding: 14px 10px;
            font-size: 14px;
            border-bottom: 1px solid rgba(255,255,255,0.04);
        }
        .bookings-table tr:hover td {
            background: rgba(255,255,255,0.02);
        }
        .status-confirmed {
            background: rgba(74,222,128,0.15);
            color: #4ade80;
            padding: 4px 12px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 600;
        }
        .status-pending {
            background: rgba(255,215,0,0.15);
            color: #FFD700;
            padding: 4px 12px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 600;
        }

        /* Full-width card */
        .full-width { grid-column: 1 / -1; }

        /* Quick Actions */
        .quick-actions {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 15px;
        }
        .action-btn {
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 10px;
            padding: 22px 15px;
            background: rgba(255,255,255,0.04);
            border: 1px solid rgba(255,255,255,0.06);
            border-radius: 16px;
            text-decoration: none;
            color: white;
            transition: all 0.3s;
        }
        .action-btn:hover {
            background: rgba(255,215,0,0.1);
            border-color: rgba(255,215,0,0.2);
            transform: translateY(-3px);
        }
        .action-btn .action-icon { font-size: 30px; }
        .action-btn .action-label {
            font-size: 13px;
            font-weight: 600;
            color: rgba(255,255,255,0.7);
        }

        /* Logout Section */
        .logout-section {
            text-align: center;
            margin-top: 40px;
            animation: slideUp 0.6s ease 0.7s both;
        }
        .logout-section .big-logout-btn {
            display: inline-flex;
            align-items: center;
            gap: 10px;
            background: linear-gradient(135deg, rgba(255,59,48,0.15), rgba(255,59,48,0.25));
            border: 1px solid rgba(255,59,48,0.3);
            color: #ff6b6b;
            padding: 14px 40px;
            border-radius: 14px;
            text-decoration: none;
            font-size: 16px;
            font-weight: 700;
            transition: all 0.3s;
        }
        .logout-section .big-logout-btn:hover {
            background: linear-gradient(135deg, rgba(255,59,48,0.25), rgba(255,59,48,0.4));
            transform: translateY(-2px);
            box-shadow: 0 10px 30px rgba(255,59,48,0.2);
        }

        /* Footer */
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
        .footer-content-area {
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
        .footer-social-links { display: flex; gap: 12px; margin-top: 20px; }
        .footer-social-links a { display: flex; align-items: center; justify-content: center; width: 36px; height: 36px; border-radius: 50%; background: rgba(255,255,255,0.08); border: 1px solid rgba(255,255,255,0.12); color: white; font-size: 16px; text-decoration: none; transition: all 0.3s; padding: 0; }
        .footer-social-links a:hover { background: #FFD700; color: #000; border-color: #FFD700; transform: translateY(-3px); }
        .footer-bottom-bar { position: relative; z-index: 2; border-top: 1px solid rgba(255,255,255,0.08); padding: 20px 40px; display: flex; justify-content: space-between; align-items: center; max-width: 1200px; margin: 0 auto; flex-wrap: wrap; gap: 10px; }
        .footer-bottom-bar p { color: rgba(255,255,255,0.35); font-size: 13px; }
        .footer-bottom-bar-links { display: flex; gap: 20px; }
        .footer-bottom-bar-links a { color: rgba(255,255,255,0.35); text-decoration: none; font-size: 13px; transition: color 0.3s; }
        .footer-bottom-bar-links a:hover { color: #FFD700; }

        @media (max-width: 768px) {
            .stats-grid { grid-template-columns: repeat(2, 1fr); }
            .content-grid { grid-template-columns: 1fr; }
            .quick-actions { grid-template-columns: 1fr; }
            nav { padding: 12px 20px; }
            .profile-header { padding: 40px 20px 60px; }
            .footer-content-area { grid-template-columns: 1fr; gap: 30px; }
            .footer-bottom-bar { flex-direction: column; text-align: center; }
        }
    </style>
</head>
<body>

<nav>
    <div class="logo">✈ WonderLanka</div>
    <div class="nav-links">
        <a href="${pageContext.request.contextPath}/home">Home</a>
        <a href="${pageContext.request.contextPath}/destinations">Destinations</a>
        <a href="${pageContext.request.contextPath}/booking">Book Now</a>
        <a href="${pageContext.request.contextPath}/contact">Contact</a>
    </div>
    <div class="nav-user">
        <div class="nav-avatar"><%= userName.substring(0, 1).toUpperCase() %></div>
        <span class="nav-user-name"><%= userName %></span>
        <a href="${pageContext.request.contextPath}/logout" class="logout-btn">🚪 Logout</a>
    </div>
</nav>

<!-- Profile Header -->
<div class="profile-header">
    <div class="profile-avatar"><%= userName.substring(0, 1).toUpperCase() %></div>
    <h1>👋 Hello, <%= userName %>!</h1>
    <p class="email">📧 <%= userEmail %></p>
    <div class="member-badge">⭐ WonderLanka Member since <%= joinDate %></div>
</div>

<!-- Profile Content -->
<div class="profile-content">

    <!-- Stats Cards -->
    <div class="stats-grid">
        <div class="stat-card">
            <div class="stat-icon">✈️</div>
            <div class="stat-number">3</div>
            <div class="stat-label">Total Bookings</div>
        </div>
        <div class="stat-card">
            <div class="stat-icon">🌍</div>
            <div class="stat-number">5</div>
            <div class="stat-label">Destinations Visited</div>
        </div>
        <div class="stat-card">
            <div class="stat-icon">⭐</div>
            <div class="stat-number">4.9</div>
            <div class="stat-label">Average Rating</div>
        </div>
        <div class="stat-card">
            <div class="stat-icon">🏆</div>
            <div class="stat-number">Gold</div>
            <div class="stat-label">Member Tier</div>
        </div>
    </div>

    <!-- Content Grid -->
    <div class="content-grid">

        <!-- Account Details -->
        <div class="glass-card">
            <h3><span>👤</span> Account Details</h3>
            <div class="detail-row">
                <span class="detail-label">Full Name</span>
                <span class="detail-value"><%= userName %></span>
            </div>
            <div class="detail-row">
                <span class="detail-label">Email</span>
                <span class="detail-value"><%= userEmail %></span>
            </div>
            <div class="detail-row">
                <span class="detail-label">Member Since</span>
                <span class="detail-value"><%= joinDate %></span>
            </div>
            <div class="detail-row">
                <span class="detail-label">Account Status</span>
                <span class="detail-badge">✅ Active</span>
            </div>
            <div class="detail-row">
                <span class="detail-label">Phone</span>
                <span class="detail-value">+94 77 123 4567</span>
            </div>
        </div>

        <!-- Quick Actions -->
        <div class="glass-card">
            <h3><span>⚡</span> Quick Actions</h3>
            <div class="quick-actions">
                <a href="${pageContext.request.contextPath}/booking" class="action-btn">
                    <span class="action-icon">🎫</span>
                    <span class="action-label">New Booking</span>
                </a>
                <a href="${pageContext.request.contextPath}/destinations" class="action-btn">
                    <span class="action-icon">🌍</span>
                    <span class="action-label">Explore</span>
                </a>
                <a href="${pageContext.request.contextPath}/contact" class="action-btn">
                    <span class="action-icon">📞</span>
                    <span class="action-label">Support</span>
                </a>
            </div>
        </div>

        <!-- Recent Bookings -->
        <div class="glass-card full-width">
            <h3><span>📋</span> Recent Bookings</h3>
            <table class="bookings-table">
                <thead>
                    <tr>
                        <th>Booking ID</th>
                        <th>Destination</th>
                        <th>Date</th>
                        <th>Persons</th>
                        <th>Package</th>
                        <th>Status</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>#WL-2024-001</td>
                        <td>🦁 Sigiriya</td>
                        <td>2024-12-15</td>
                        <td>2</td>
                        <td>Premium</td>
                        <td><span class="status-confirmed">Confirmed</span></td>
                    </tr>
                    <tr>
                        <td>#WL-2024-002</td>
                        <td>🐋 Mirissa</td>
                        <td>2024-12-20</td>
                        <td>4</td>
                        <td>Standard</td>
                        <td><span class="status-confirmed">Confirmed</span></td>
                    </tr>
                    <tr>
                        <td>#WL-2024-003</td>
                        <td>🚂 Ella</td>
                        <td>2025-01-05</td>
                        <td>2</td>
                        <td>Premium</td>
                        <td><span class="status-pending">Pending</span></td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>

    <!-- Logout Section -->
    <div class="logout-section">
        <a href="${pageContext.request.contextPath}/logout" class="big-logout-btn">
            🚪 Sign Out of WonderLanka
        </a>
        <p style="margin-top: 12px; color: rgba(255,255,255,0.3); font-size: 13px;">
            You will be redirected to the home page
        </p>
    </div>

</div>

<div class="site-footer">
    <div class="footer-bg">
        <div class="footer-content-area">
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
                <div class="footer-social-links"><a href="#">f</a><a href="#">📷</a><a href="#">▶</a><a href="#">in</a><a href="#">🎵</a></div>
            </div>
        </div>
        <div class="footer-bottom-bar">
            <p>© 2026 WonderLanka Travels. All rights reserved.</p>
            <div class="footer-bottom-bar-links"><a href="#">Terms & Conditions</a><a href="#">Privacy Policy</a><a href="#">Sitemap</a></div>
        </div>
    </div>
</div>

</body>
</html>
