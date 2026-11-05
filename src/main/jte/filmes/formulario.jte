@template.layouts.base(titulo = "Adicionar título", conteudo = @`
    <section class="pagina-cabecalho">

        <span class="sobretitulo">BIBLIOTECA PESSOAL / NOVO ITEM</span>

        <h1>Adicionar <em>título.</em></h1>

        <p>
            Registre o que você quer assistir.
            Os campos com * são obrigatórios.
        </p>

    </section>

    <section class="painel-formulario">

        <div class="form-intro">
            <span class="form-numero">01</span>
            <h2>Informações do título</h2>
            <p>Preencha os dados para organizar sua watchlist.</p>
        </div>

        <form method="post" action="/filmes" class="formulario">

            <div class="campo campo-largo">
                <label for="nome">Nome do título *</label>

                <input
                        type="text"
                        id="nome"
                        name="nome"
                        placeholder="Ex.: Interestelar"
                        required
                >
            </div>

            <div class="campo">

                <label>Tipo *</label>

                <div class="opcoes-radio">

                    <label class="radio-card">
                        <input type="radio" name="tipo"
                               value="Filme" checked>
                        <span>▣</span> Filme
                    </label>

                    <label class="radio-card">
                        <input type="radio" name="tipo"
                               value="Série">
                        <span>▤</span> Série
                    </label>

                </div>

            </div>

            <div class="campo">

                <label for="genero">Gênero *</label>

                <select id="genero" name="genero" required>
                    <option value="Ação">Ação</option>
                    <option value="Aventura">Aventura</option>
                    <option value="Animação">Animação</option>
                    <option value="Comédia">Comédia</option>
                    <option value="Drama">Drama</option>
                    <option value="Ficção">Ficção</option>
                    <option value="Romance">Romance</option>
                    <option value="Terror">Terror</option>
                    <option value="Suspense">Suspense</option>
                </select>

            </div>

            <div class="campo">

                <label for="plataforma">Plataforma *</label>

                <select id="plataforma" name="plataforma" required>
                    <option value="Netflix">Netflix</option>
                    <option value="Disney+">Disney+</option>
                    <option value="Max">Max</option>
                    <option value="Prime Video">Prime Video</option>
                    <option value="Apple TV+">Apple TV+</option>
                    <option value="Outra">Outra</option>
                </select>

            </div>

            <div class="campo">

                <label for="dataPrevista">Quando pretende assistir?</label>

                <input
                        type="date"
                        id="dataPrevista"
                        name="dataPrevista"
                >

            </div>

            <div class="form-acoes campo-largo">

                <a class="botao botao-secundario" href="/filmes">
                    Cancelar
                </a>

                <button class="botao botao-principal" type="submit">
                    Salvar na lista ↗
                </button>

            </div>

        </form>

    </section>
`)