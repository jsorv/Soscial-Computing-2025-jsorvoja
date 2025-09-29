-- SQLite

SELECT u.id, u.username,
    COUNT(DISTINCT c.id) + COUNT(DISTINCT r.id) AS engagement
FROM users u
JOIN posts p ON p.user_id = u.id
LEFT JOIN comments  c ON c.post_id = p.id
LEFT JOIN reactions r ON r.post_id = p.id
GROUP BY u.id, u.username
ORDER BY engagement DESC
LIMIT 5;
