package com.medicamentos.api.controller;

import com.medicamentos.api.dto.MedicamentoRequest;
import com.medicamentos.api.model.Medicamento;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.atomic.AtomicLong;

@RestController
@RequestMapping("/medicamentos")
@CrossOrigin(origins = "*")
public class MedicamentoController {

    private final List<Medicamento> medicamentos = new ArrayList<>();
    private final AtomicLong counter = new AtomicLong();

    @PostMapping
    public ResponseEntity<Map<String, Object>> cadastrar(@RequestBody MedicamentoRequest request) {
        Map<String, Object> response = new HashMap<>();

        // Validar nome
        if (request.getNome() == null || request.getNome().isBlank()) {
            response.put("status", "erro");
            response.put("mensagem", "Nome é obrigatório");
            response.put("codigoErro", "NOME_INVALIDO");
            return ResponseEntity.badRequest().body(response);
        }

        if (request.getNome().length() > 100) {
            response.put("status", "erro");
            response.put("mensagem", "Nome excede o limite de 100 caracteres");
            response.put("codigoErro", "NOME_MUITO_LONGO");
            return ResponseEntity.badRequest().body(response);
        }

        // Validar dose
        if (request.getDose() == null || request.getDose().isBlank()) {
            response.put("status", "erro");
            response.put("mensagem", "Dose é obrigatória");
            response.put("codigoErro", "DOSE_INVALIDA");
            return ResponseEntity.badRequest().body(response);
        }

        // Validar horario
        if (request.getHorario() == null || request.getHorario().isBlank()) {
            response.put("status", "erro");
            response.put("mensagem", "Horário é obrigatório");
            response.put("codigoErro", "HORARIO_INVALIDO");
            return ResponseEntity.badRequest().body(response);
        }

        // Validar quantidade
        if (request.getQuantidade() == null || request.getQuantidade() <= 0) {
            response.put("status", "erro");
            response.put("mensagem", "Quantidade deve ser um inteiro positivo");
            response.put("codigoErro", "QUANTIDADE_INVALIDA");
            return ResponseEntity.badRequest().body(response);
        }

        // Salvar medicamento
        Medicamento medicamento = new Medicamento(
            counter.incrementAndGet(),
            request.getNome(),
            request.getDose(),
            request.getHorario(),
            request.getQuantidade()
        );
        medicamentos.add(medicamento);

        Map<String, Object> dados = new HashMap<>();
        dados.put("id", medicamento.getId());
        dados.put("nome", medicamento.getNome());
        dados.put("dose", medicamento.getDose());
        dados.put("horario", medicamento.getHorario());
        dados.put("quantidade", medicamento.getQuantidade());

        response.put("status", "sucesso");
        response.put("mensagem", "Medicamento cadastrado com sucesso");
        response.put("dados", dados);

        return ResponseEntity.status(201).body(response);
    }
}
