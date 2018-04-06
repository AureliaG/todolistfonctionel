<!doctype html>
<html>
  <head>
    <meta charset="utf-8">
    <title>Parcourir les todos</title>
  </head>
  <body>
    <h1>todo-list</h1>
    <ul>
    <?php

      foreach ($todos as $ligne) {
    ?>
      <li>
        <a href="read.php?id=<?php echo $ligne['id']; ?>">
          <?php echo $ligne['title']; ?>
          <p><?php echo $todos['art_content'] ?></p>
        </a>
      </li>
    <?php
      }
    ?>
      <li><a href="add.php">ajouter une tâche...</a></li>
    </ul>
  </body>
</html>