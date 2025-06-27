<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST, PUT, DELETE');
header('Access-Control-Allow-Headers: Content-Type');

// Database configuration (adjust according to your setup)
$host = 'localhost';
$dbname = 'booknest';
$username = 'root';
$password = '';

try {
    $pdo = new PDO("mysql:host=$host;dbname=$dbname", $username, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch(PDOException $e) {
    die(json_encode(['error' => 'Database connection failed: ' . $e->getMessage()]));
}

// Get the action from POST data
$action = $_POST['action'] ?? $_GET['action'] ?? '';
$userId = $_POST['user_id'] ?? $_GET['user_id'] ?? 1; // Default user ID for demo

switch($action) {
    case 'get_communities':
        getUserCommunities($pdo, $userId);
        break;
        
    case 'join_community':
        joinCommunity($pdo, $userId);
        break;
        
    case 'leave_community':
        leaveCommunity($pdo, $userId);
        break;
        
    default:
        echo json_encode(['error' => 'Invalid action']);
        break;
}

function getUserCommunities($pdo, $userId) {
    try {
        $stmt = $pdo->prepare("
            SELECT uc.*, c.name, c.description, c.category, c.icon, c.image, c.total_members, c.total_posts
            FROM user_communities uc 
            JOIN communities c ON uc.community_id = c.id 
            WHERE uc.user_id = ? AND uc.status = 'active'
            ORDER BY uc.joined_date DESC
        ");
        $stmt->execute([$userId]);
        $communities = $stmt->fetchAll(PDO::FETCH_ASSOC);
        
        echo json_encode(['success' => true, 'communities' => $communities]);
    } catch(PDOException $e) {
        echo json_encode(['error' => 'Failed to fetch communities: ' . $e->getMessage()]);
    }
}

function joinCommunity($pdo, $userId) {
    try {
        $communityData = json_decode($_POST['community'], true);
        
        // First, insert or update the community
        $stmt = $pdo->prepare("
            INSERT INTO communities (name, description, category, icon, image, total_members, total_posts) 
            VALUES (?, ?, ?, ?, ?, ?, ?)
            ON DUPLICATE KEY UPDATE 
            total_members = VALUES(total_members),
            total_posts = VALUES(total_posts)
        ");
        $stmt->execute([
            $communityData['name'],
            $communityData['description'],
            $communityData['category'],
            $communityData['icon'],
            $communityData['image'],
            $communityData['members'],
            $communityData['posts']
        ]);
        
        $communityId = $pdo->lastInsertId() ?: getCommunityIdByName($pdo, $communityData['name']);
        
        // Then, add user to community
        $stmt = $pdo->prepare("
            INSERT INTO user_communities (user_id, community_id, joined_date, status) 
            VALUES (?, ?, NOW(), 'active')
            ON DUPLICATE KEY UPDATE status = 'active', joined_date = NOW()
        ");
        $stmt->execute([
            $userId,
            $communityId
        ]);
        
        echo json_encode(['success' => true, 'message' => 'Successfully joined community']);
    } catch(PDOException $e) {
        echo json_encode(['error' => 'Failed to join community: ' . $e->getMessage()]);
    }
}

function leaveCommunity($pdo, $userId) {
    try {
        $communityId = $_POST['community_id'];
        
        // Update user_communities status to 'left'
        $stmt = $pdo->prepare("
            UPDATE user_communities 
            SET status = 'left', left_date = NOW() 
            WHERE user_id = ? AND community_id = ?
        ");
        $stmt->execute([$userId, $communityId]);
        
        if ($stmt->rowCount() > 0) {
            echo json_encode(['success' => true, 'message' => 'Successfully left community']);
        } else {
            echo json_encode(['error' => 'Community not found or already left']);
        }
    } catch(PDOException $e) {
        echo json_encode(['error' => 'Failed to leave community: ' . $e->getMessage()]);
    }
}

function getCommunityIdByName($pdo, $name) {
    $stmt = $pdo->prepare("SELECT id FROM communities WHERE name = ?");
    $stmt->execute([$name]);
    return $stmt->fetchColumn();
}

/*
SQL to create required tables (run this once in your database):

CREATE DATABASE IF NOT EXISTS booknest;
USE booknest;

CREATE TABLE IF NOT EXISTS communities (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) UNIQUE NOT NULL,
    description TEXT,
    category VARCHAR(100),
    icon VARCHAR(100),
    image VARCHAR(255),
    total_members INT DEFAULT 0,
    total_posts INT DEFAULT 0,
    created_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS user_communities (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    community_id INT NOT NULL,
    joined_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    left_date TIMESTAMP NULL,
    status ENUM('active', 'left') DEFAULT 'active',
    UNIQUE KEY unique_user_community (user_id, community_id)
);

-- Sample data for testing
INSERT INTO communities (name, description, category, icon, image, total_members, total_posts) VALUES
('Classic Literature Club', 'Dive deep into timeless classics from Shakespeare to Dickens.', 'fiction', 'fas fa-book-open', '/placeholder.svg?height=200&width=400', 2847, 156),
('Mystery & Thriller Readers', 'Unravel mysteries and discuss plot twists with fellow thriller enthusiasts.', 'mystery', 'fas fa-search', '/placeholder.svg?height=200&width=400', 1923, 89),
('Sci-Fi Universe', 'Explore futuristic worlds and discuss science fiction masterpieces.', 'sci-fi', 'fas fa-rocket', '/placeholder.svg?height=200&width=400', 2134, 178);

-- Sample user communities (assuming user_id = 1)
INSERT INTO user_communities (user_id, community_id, status) VALUES
(1, 1, 'active'),
(1, 2, 'active'),
(1, 3, 'active');
*/
?>
