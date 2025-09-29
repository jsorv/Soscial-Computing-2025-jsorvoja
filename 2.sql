SELECT 
  u.id AS user_ID,
  u.username,
  t.content,
  COUNT(*) AS times_used
FROM ( 
  SELECT user_id, content FROM posts
  UNION ALL
  SELECT user_id, content FROM comments
) t
JOIN users u ON u.id = t.user_id
GROUP BY u.id, u.username, t.content
HAVING COUNT(*) >= 3;
