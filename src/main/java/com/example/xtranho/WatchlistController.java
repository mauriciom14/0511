package com.example.xtranho;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class WatchlistController {

    private final List<Filme> filmes = new ArrayList<>();

    private long proximoId = 1;

    @GetMapping("/")
    public String inicio(Model model) {

        model.addAttribute("total", filmes.size());

        model.addAttribute("totalAssistidos",
                filmes.stream()
                        .filter(Filme::assistido)
                        .count());

        return "index";
    }

    @GetMapping("/filmes/novo")
    public String novo() {
        return "filmes/formulario";
    }

    @PostMapping("/filmes")
    public String cadastrar(
            @ModelAttribute FilmeFormulario formulario) {

        Filme filme = new Filme(
                0,
                formulario.nome(),
                formulario.tipo(),
                formulario.genero(),
                formulario.plataforma(),
                formulario.dataPrevista(),
                false,
                null,
                0
        );

        filmes.add(filme.comId(proximoId++));

        return "redirect:/filmes";
    }

    @GetMapping("/filmes")
    public String listar(
            @RequestParam(defaultValue = "") String busca,
            Model model) {

        List<Filme> resultado = new ArrayList<>();

        for (Filme filme : filmes) {

            if (!filme.assistido()
                    && filme.nome().toLowerCase()
                    .contains(busca.toLowerCase())) {

                resultado.add(filme);
            }
        }

        model.addAttribute("filmes", resultado);
        model.addAttribute("busca", busca);

        return "filmes/lista";
    }

    @PostMapping("/filmes/{id}/assistir")
    public String marcarComoAssistido(
            @PathVariable long id) {

        for (int i = 0; i < filmes.size(); i++) {

            Filme filme = filmes.get(i);

            if (filme.id() == id) {
                filmes.set(i, filme.marcarComoAssistido());
                break;
            }
        }

        return "redirect:/filmes";
    }

    @GetMapping("/assistidos")
    public String assistidos(Model model) {

        List<Filme> resultado = new ArrayList<>();

        for (Filme filme : filmes) {

            if (filme.assistido()) {
                resultado.add(filme);
            }
        }

        model.addAttribute("assistidos", resultado);

        return "assistidos";
    }

    @PostMapping("/assistidos/{id}/nota")
    public String avaliar(
            @PathVariable long id,
            @RequestParam int nota) {

        if (nota >= 1 && nota <= 5) {

            for (int i = 0; i < filmes.size(); i++) {

                Filme filme = filmes.get(i);

                if (filme.id() == id && filme.assistido()) {
                    filmes.set(i, filme.comNota(nota));
                    break;
                }
            }
        }

        return "redirect:/assistidos";
    }
}