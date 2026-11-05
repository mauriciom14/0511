@import gg.jte.Content

@param String titulo
@param Content conteudo

<!DOCTYPE html>
<html lang="pt-BR">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>${titulo} | Minha Watchlist</title>

    <link rel="stylesheet" href="/css/style.css">

</head>

<body>

<div class="fundo-luz"></div>

<header class="topo">

    <a class="marca" href="/">
        <span class="marca-icone">◈</span>

        <span>
                screen<span class="marca-destaque">log</span>
            </span>
    </a>

    @template.componentes.navegacao()

</header>

<main class="conteudo">
    ${conteudo}
</main>

<footer class="rodape">
    <span>SCREENLOG</span>
    <span>Sua próxima história começa aqui.</span>
</footer>

</body>
</html>