@import com.example.xtranho.Filme
@import java.util.List

@param List<Filme> assistidos

@template.layouts.base(titulo = "Já assisti", conteudo = @`
    <section class="pagina-cabecalho">

        <span class="sobretitulo">SUA BIBLIOTECA / 02</span>

        <h1>Vistos e <em>lembrados.</em></h1>

        <p>
            Os títulos que já passaram pela sua tela.
            Registre uma nota de 1 a 5 para cada um.
        </p>

    </section>

    <section class="lista-itens lista-assistidos">

        @if (assistidos.isEmpty())

            <div class="estado-vazio">
                <span>◷</span>

                <h2>Sua lista de assistidos está vazia.</h2>

                <p>
                    Quando marcar um título como assistido,
                    ele aparecerá aqui.
                </p>

                <a class="botao botao-principal" href="/filmes">
                    Ver minha lista
                </a>
            </div>

        @else

            @for (Filme filme : assistidos)

                <article class="item-filme item-assistido">

                    <div class="item-identidade">

                        <span class="item-tipo item-tipo-visto">✓</span>

                        <div>
                            <h2>${filme.nome()}</h2>

                            <p>
                                ${filme.tipo()}
                                ·
                                ${filme.genero()}
                                ·
                                ${filme.plataforma()}
                            </p>
                        </div>

                    </div>

                    <div class="item-data">

                        <span class="mini-label">ASSISTIDO EM</span>

                        ${filme.dataAssistido().toString()}

                    </div>

                    <div class="avaliacao">

                        <span class="mini-label">SUA NOTA</span>

                        @if (filme.nota() > 0)

                            <span class="estrelas">
                                ${"★".repeat(filme.nota())}${"☆".repeat(5 - filme.nota())}
                            </span>

                        @else

                            <form
                                    method="post"
                                    action="/assistidos/${filme.id()}/nota"
                                    class="form-nota"
                            >

                                <select name="nota" aria-label="Nota de 1 a 5">
                                    <option value="5">5 estrelas</option>
                                    <option value="4">4 estrelas</option>
                                    <option value="3">3 estrelas</option>
                                    <option value="2">2 estrelas</option>
                                    <option value="1">1 estrela</option>
                                </select>

                                <button type="submit">Avaliar</button>

                            </form>

                        @endif

                    </div>

                </article>

            @endfor

        @endif

    </section>
`)