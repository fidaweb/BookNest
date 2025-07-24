<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);


require 'session.php';

header('Content-Type: application/json');


if (!checkSession($conn)) {
    echo json_encode(['error' => 'Unauthorized: Session invalid or user not logged in.']);
    exit();
}



if (!isset($_SESSION["user_id"])) { 
    echo json_encode(['error' => 'User ID not found in session.']);
    exit();
}
$user_id = (int)$_SESSION["user_id"]; 

$books = [];

try {
    //  payments table match kore user_if,book_id to fetch
    $stmt_payments = $conn->prepare("SELECT book_id FROM payments WHERE user_id = ?");
    if (!$stmt_payments) {
        throw new Exception("Failed to prepare payments statement: " . $conn->error);
    }
    $stmt_payments->bind_param("i", $user_id);
    $stmt_payments->execute();
    $result_payments = $stmt_payments->get_result();

    $book_ids = [];
    while ($row = $result_payments->fetch_assoc()) {
        $book_ids[] = $row['book_id'];
    }
    $stmt_payments->close();



    if (empty($book_ids)) {
        echo json_encode(['message' => 'No books found for this user.']);
        exit();
    }

    // echo json_encode($book_ids);
    $placeholders = implode(',', array_fill(0, count($book_ids), '?'));
    $types = str_repeat('i', count($book_ids)); 

    //book details fetch
    // $stmt_books = $conn->prepare("SELECT book_id, title, author, description, price, image FROM books WHERE book_id IN ($placeholders)");
    $stmt_books = $conn->prepare("SELECT id, Book_Title, Book_Author, description, PRICE, Image_URL_L FROM books WHERE id IN ($placeholders)");
    if (!$stmt_books) {
        throw new Exception("Failed to prepare books statement: " . $conn->error);
    }
    $stmt_books->bind_param($types, ...$book_ids);
    $stmt_books->execute();
    $result_books = $stmt_books->get_result();

    while ($row = $result_books->fetch_assoc()) {
        $books[] = $row;
    }
    $stmt_books->close();
    echo json_encode($books);

    

  

} catch (Exception $e) {
    error_log("Error in mybooks.php: " . $e->getMessage());
    echo json_encode(['error' => 'An internal server error occurred.']);
} finally {
    if ($conn) {
        $conn->close();
    }
}
?>
