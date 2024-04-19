use instagram_low_cost;
SELECT f.*
FROM fotos f
JOIN comentarios c ON f.idFoto = c.idComentario
JOIN usuarios u ON c.idUsuario = u.idUsuario
WHERE u.idUsuario = 25 AND c.comentario LIKE '%sorprendido%';