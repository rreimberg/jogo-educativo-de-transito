import haxe.ds.ArraySort;
import Math;

import flash.display.Bitmap;

import Question;
import Utils;


class QuizData {
    var index : Array<String>;
    var questions : Map<String,Question>;
    var current : String;

    public function new() {
        this.init();
    }

    public function raffle() {
        this.current = this.getRandomIndex();
    }

    public function getImage() {
        return this.questions[this.current].getImage();
    }

    public function checkAnswer(answer) {
        return this.questions[current].check(answer);
    }

    public function getOptions():Array<String> {
        var options = new Array<String>();
        options.push(this.questions[current].getDescription());
        options.push(this.questions[this.getRandomIndex()].getDescription());
        options.push(this.questions[this.getRandomIndex()].getDescription());
        options.push(this.questions[this.getRandomIndex()].getDescription());

        Utils.shuffle(options);

        return options;
    }

    private function getRandomIndex() {
        var number = Utils.random(0, this.index.length);
        return this.index[number];
    }

    // LOAD All resources
    public function init() {

        this.questions = new Map<String,Question>();
        this.index = new Array<String>();

        this.questions.set("R-1", new Question("Parada Obrigatória", new Bitmap(new ImagesResources.R1BitmapData(0, 0))));
        this.questions.set("R-2", new Question("Dê a preferência", new Bitmap(new ImagesResources.R2BitmapData(0, 0))));
        this.questions.set("R-3", new Question("Sentido proibido", new Bitmap(new ImagesResources.R3BitmapData(0, 0))));
        this.questions.set("R-4A", new Question("Proibido virar à esquerda", new Bitmap(new ImagesResources.R4ABitmapData(0, 0))));
        this.questions.set("R-4B", new Question("Proibido virar à direita", new Bitmap(new ImagesResources.R4BBitmapData(0, 0))));
        this.questions.set("R-5", new Question("Proibido retornar", new Bitmap(new ImagesResources.R5BitmapData(0, 0))));
        this.questions.set("R-6A", new Question("Proibido estacionar", new Bitmap(new ImagesResources.R6ABitmapData(0, 0))));
        this.questions.set("R-6B", new Question("Estacionamento  regulamentado", new Bitmap(new ImagesResources.R6BBitmapData(0, 0))));
        this.questions.set("R-6C", new Question("Proibido parar e estacionar", new Bitmap(new ImagesResources.R6CBitmapData(0, 0))));
        this.questions.set("R-7", new Question("Proibido ultrapassar", new Bitmap(new ImagesResources.R7BitmapData(0, 0))));
        this.questions.set("R-8", new Question("Proibido mudar de faixa de trânsito", new Bitmap(new ImagesResources.R8BitmapData(0, 0))));
        this.questions.set("R-9", new Question("Proibido trânsito de veículos de carga", new Bitmap(new ImagesResources.R9BitmapData(0, 0))));
        this.questions.set("R-10", new Question("Proibido trânsito de veículo automotores", new Bitmap(new ImagesResources.R10BitmapData(0, 0))));
        this.questions.set("R-11", new Question("Proibido trânsito de veículos de tração animal", new Bitmap(new ImagesResources.R11BitmapData(0, 0))));
        this.questions.set("R-12", new Question("Proibido trânsito de bicicletas", new Bitmap(new ImagesResources.R12BitmapData(0, 0))));
        this.questions.set("R-13", new Question("Proibido trânsito de máquinas agrícola", new Bitmap(new ImagesResources.R13BitmapData(0, 0))));
        this.questions.set("R-14", new Question("Carga máxima permitida", new Bitmap(new ImagesResources.R14BitmapData(0, 0))));
        this.questions.set("R-15", new Question("Altura máxima permitida", new Bitmap(new ImagesResources.R15BitmapData(0, 0))));
        this.questions.set("R-16", new Question("Largura máxima permitida", new Bitmap(new ImagesResources.R16BitmapData(0, 0))));
        this.questions.set("R-17", new Question("Peso máximo permitido por eixo", new Bitmap(new ImagesResources.R17BitmapData(0, 0))));
        this.questions.set("R-18", new Question("Comprimento máximo permitido", new Bitmap(new ImagesResources.R18BitmapData(0, 0))));
        this.questions.set("R-19", new Question("Velocidade máxima permitida", new Bitmap(new ImagesResources.R19BitmapData(0, 0))));
        this.questions.set("R-20", new Question("Proibido acionar buzina ou sinal sonoro", new Bitmap(new ImagesResources.R20BitmapData(0, 0))));
        this.questions.set("R-21", new Question("Alfândega", new Bitmap(new ImagesResources.R21BitmapData(0, 0))));
        this.questions.set("R-22", new Question("Uso obrigatório de corrente", new Bitmap(new ImagesResources.R22BitmapData(0, 0))));
        this.questions.set("R-23", new Question("Conserve-se à direita", new Bitmap(new ImagesResources.R23BitmapData(0, 0))));
        this.questions.set("R-24A", new Question("Sentido obrigatório", new Bitmap(new ImagesResources.R24ABitmapData(0, 0))));
        this.questions.set("R-24B", new Question("Passagem obrigatório", new Bitmap(new ImagesResources.R24BBitmapData(0, 0))));
        this.questions.set("R-25A", new Question("Vire à esquerda", new Bitmap(new ImagesResources.R25ABitmapData(0, 0))));
        this.questions.set("R-25B", new Question("Vire à direita", new Bitmap(new ImagesResources.R25BBitmapData(0, 0))));
        this.questions.set("R-25C", new Question("Siga em frente ou à esquerda", new Bitmap(new ImagesResources.R25CBitmapData(0, 0))));
        this.questions.set("R-25D", new Question("Siga em frente ou à esquerda", new Bitmap(new ImagesResources.R25DBitmapData(0, 0))));
        this.questions.set("R-26", new Question("Siga em frente", new Bitmap(new ImagesResources.R26BitmapData(0, 0))));
        this.questions.set("R-27", new Question("Veículos lentos usem faixa da direita", new Bitmap(new ImagesResources.R27BitmapData(0, 0))));
        this.questions.set("R-28", new Question("Mão dupla", new Bitmap(new ImagesResources.R28BitmapData(0, 0))));
        this.questions.set("R-29", new Question("Proibido trânsito de pedestres", new Bitmap(new ImagesResources.R29BitmapData(0, 0))));
        this.questions.set("R-30", new Question("Pedestre ande pela esquerda", new Bitmap(new ImagesResources.R30BitmapData(0, 0))));
        this.questions.set("R-31", new Question("Pedestre ande pela direita", new Bitmap(new ImagesResources.R31BitmapData(0, 0))));
        this.questions.set("R-32", new Question("Circulaçao exclusiva de ônibus", new Bitmap(new ImagesResources.R32BitmapData(0, 0))));
        this.questions.set("R-33", new Question("Sentido circular na rotatória", new Bitmap(new ImagesResources.R33BitmapData(0, 0))));
        this.questions.set("R-34", new Question("Circulaçao exclusiva de bicicletas", new Bitmap(new ImagesResources.R34BitmapData(0, 0))));
        this.questions.set("R-35A", new Question("Ciclista, transite à esquerda", new Bitmap(new ImagesResources.R35ABitmapData(0, 0))));
        this.questions.set("R-35B", new Question("Ciclista, transite à direita", new Bitmap(new ImagesResources.R35BBitmapData(0, 0))));
        this.questions.set("R-36A", new Question("Ciclista à esquerda, pedestre a direita", new Bitmap(new ImagesResources.R36ABitmapData(0, 0))));
        this.questions.set("R-36B", new Question("Pedestre à esquerda, ciclista a direita", new Bitmap(new ImagesResources.R36BBitmapData(0, 0))));
        this.questions.set("R-37", new Question("Proibido trânsito de motocicleta, motonetas e ciclomotores", new Bitmap(new ImagesResources.R37BitmapData(0, 0))));
        this.questions.set("R-38", new Question("Proibido trânsito de ônibus", new Bitmap(new ImagesResources.R38BitmapData(0, 0))));
        this.questions.set("R-39", new Question("Circulaçao exclusiva de caminhão", new Bitmap(new ImagesResources.R39BitmapData(0, 0))));
        this.questions.set("R-40", new Question("Trânsito proibido a carros de mão", new Bitmap(new ImagesResources.R40BitmapData(0, 0))));
        this.questions.set("A-1a", new Question("Curva Acentuada à Esquerda", new Bitmap(new ImagesResources.A1ABitmapData(0, 0))));
        this.questions.set("A-1b", new Question("Curva Acentuada à Direita", new Bitmap(new ImagesResources.A1BBitmapData(0, 0))));
        this.questions.set("A-2a", new Question("Curva à Esquerda", new Bitmap(new ImagesResources.A2ABitmapData(0, 0))));
        this.questions.set("A-2b", new Question("Curva à Direita", new Bitmap(new ImagesResources.A2BBitmapData(0, 0))));
        this.questions.set("A-3a", new Question("Pista Sinuosa à Direita", new Bitmap(new ImagesResources.A3ABitmapData(0, 0))));
        this.questions.set("A-3b", new Question("Pista Sinuosa à Esquerda", new Bitmap(new ImagesResources.A3BBitmapData(0, 0))));
        this.questions.set("A-4a", new Question("Curva Acentuda em \"S\" à Esquerda", new Bitmap(new ImagesResources.A4ABitmapData(0, 0))));
        this.questions.set("A-4b", new Question("Curva Acentuda em \"S\" à Direita", new Bitmap(new ImagesResources.A4BBitmapData(0, 0))));
        this.questions.set("A-5a", new Question("Curva em \"S\" à Direita", new Bitmap(new ImagesResources.A5ABitmapData(0, 0))));
        this.questions.set("A-5b", new Question("Curva em \"S\" à Esquerda", new Bitmap(new ImagesResources.A5BBitmapData(0, 0))));
        this.questions.set("A-6", new Question("Cruzamento de Vias", new Bitmap(new ImagesResources.A6BitmapData(0, 0))));
        this.questions.set("A-7a", new Question("Via lateral à esquerda ", new Bitmap(new ImagesResources.A7ABitmapData(0, 0))));
        this.questions.set("A-7b", new Question("Via lateral à direita ", new Bitmap(new ImagesResources.A7BBitmapData(0, 0))));
        this.questions.set("A-8", new Question("Interseção em “T” ", new Bitmap(new ImagesResources.A8BitmapData(0, 0))));
        this.questions.set("A-9", new Question("Bifurcação em “Y” ", new Bitmap(new ImagesResources.A9BitmapData(0, 0))));
        this.questions.set("A-10a", new Question("Entroncamento oblíquo à esquerda ", new Bitmap(new ImagesResources.A10ABitmapData(0, 0))));
        this.questions.set("A-10b", new Question("Entroncamento oblíquo à direita", new Bitmap(new ImagesResources.A10BBitmapData(0, 0))));
        this.questions.set("A-11a", new Question("Junções sucessivas contrárias, primeira à esquerda ", new Bitmap(new ImagesResources.A11ABitmapData(0, 0))));
        this.questions.set("A-11b", new Question("Junções Sucessivas Contrárias 1ª à direita", new Bitmap(new ImagesResources.A11BBitmapData(0, 0))));
        this.questions.set("A-12", new Question("Inteseção em Círculo", new Bitmap(new ImagesResources.A12BitmapData(0, 0))));
        this.questions.set("A-13a", new Question("Confluência à Direita", new Bitmap(new ImagesResources.A13ABitmapData(0, 0))));
        this.questions.set("A-13b", new Question("Confluência à Esquerda", new Bitmap(new ImagesResources.A13BBitmapData(0, 0))));
        this.questions.set("A-14", new Question("Semáforo a Frente", new Bitmap(new ImagesResources.A14BitmapData(0, 0))));
        this.questions.set("A-15", new Question("Parada Obrigatória à Frente", new Bitmap(new ImagesResources.A15BitmapData(0, 0))));
        this.questions.set("A-16", new Question("Bonde", new Bitmap(new ImagesResources.A16BitmapData(0, 0))));
        this.questions.set("A-17", new Question("Pista Irregular", new Bitmap(new ImagesResources.A17BitmapData(0, 0))));
        this.questions.set("A-18", new Question("Saliência ou Lombada", new Bitmap(new ImagesResources.A18BitmapData(0, 0))));
        this.questions.set("A-19", new Question("Depressão", new Bitmap(new ImagesResources.A19BitmapData(0, 0))));
        this.questions.set("A-20a", new Question("Declive Acentuado", new Bitmap(new ImagesResources.A20ABitmapData(0, 0))));
        this.questions.set("A-20b", new Question("Aclive Acentuado", new Bitmap(new ImagesResources.A20BBitmapData(0, 0))));
        this.questions.set("A-21a", new Question("Estreitamento de Pista ao Centro", new Bitmap(new ImagesResources.A21ABitmapData(0, 0))));
        this.questions.set("A-21b", new Question("Estreitamento de Pista à Esquerda", new Bitmap(new ImagesResources.A21BBitmapData(0, 0))));
        this.questions.set("A-21c", new Question("Estreitamento de Pista à Direita", new Bitmap(new ImagesResources.A21CBitmapData(0, 0))));
        this.questions.set("A-22", new Question("Ponte Estreita", new Bitmap(new ImagesResources.A22BitmapData(0, 0))));
        this.questions.set("A-23", new Question("Ponte Móvel", new Bitmap(new ImagesResources.A23BitmapData(0, 0))));
        this.questions.set("A-24", new Question("Obras", new Bitmap(new ImagesResources.A24BitmapData(0, 0))));
        this.questions.set("A-25", new Question("Mão Dupla Adiante", new Bitmap(new ImagesResources.A25BitmapData(0, 0))));
        this.questions.set("A-26a", new Question("Sentido Único", new Bitmap(new ImagesResources.A26ABitmapData(0, 0))));
        this.questions.set("A-26b", new Question("Sentido Duplo", new Bitmap(new ImagesResources.A26BBitmapData(0, 0))));
        this.questions.set("A-27", new Question("Área com Desmoronamento", new Bitmap(new ImagesResources.A27BitmapData(0, 0))));
        this.questions.set("A-28", new Question("Pista Escorregadia", new Bitmap(new ImagesResources.A28BitmapData(0, 0))));
        this.questions.set("A-29", new Question("Projeção de Cascalho", new Bitmap(new ImagesResources.A29BitmapData(0, 0))));
        this.questions.set("A-30", new Question("Ciclistas", new Bitmap(new ImagesResources.A30BitmapData(0, 0))));
        this.questions.set("A-31", new Question("Maquinaria Agrícola", new Bitmap(new ImagesResources.A31BitmapData(0, 0))));
        this.questions.set("A-32a", new Question("Passagem de Pedestres", new Bitmap(new ImagesResources.A32ABitmapData(0, 0))));
        this.questions.set("A-33a", new Question("Área Escolar", new Bitmap(new ImagesResources.A33ABitmapData(0, 0))));
        this.questions.set("A-33b", new Question("Passagem Sinalizada de Escolares", new Bitmap(new ImagesResources.A33BBitmapData(0, 0))));
        this.questions.set("A-34", new Question("Crianças", new Bitmap(new ImagesResources.A34BitmapData(0, 0))));
        this.questions.set("A-35", new Question("Cuidado Animais", new Bitmap(new ImagesResources.A35BitmapData(0, 0))));
        this.questions.set("A-36", new Question("Animais Selvagens", new Bitmap(new ImagesResources.A36BitmapData(0, 0))));
        this.questions.set("A-37", new Question("Altura Limitada", new Bitmap(new ImagesResources.A37BitmapData(0, 0))));
        this.questions.set("A-38", new Question("Largura Limitada", new Bitmap(new ImagesResources.A38BitmapData(0, 0))));
        this.questions.set("A-39", new Question("Passagem de Nível sem Barreira", new Bitmap(new ImagesResources.A39BitmapData(0, 0))));
        this.questions.set("A-40", new Question("Passagem de Nível com Barreira", new Bitmap(new ImagesResources.A40BitmapData(0, 0))));
        this.questions.set("A-41", new Question("Cruz de Sto. André", new Bitmap(new ImagesResources.A41BitmapData(0, 0))));
        this.questions.set("A-42a", new Question("Início de Pista Dupla", new Bitmap(new ImagesResources.A42ABitmapData(0, 0))));
        this.questions.set("A-42b", new Question("Fim de Pista Dupla", new Bitmap(new ImagesResources.A42BBitmapData(0, 0))));
        this.questions.set("A-43", new Question("Aeroporto", new Bitmap(new ImagesResources.A43BitmapData(0, 0))));
        this.questions.set("A-44", new Question("Vento Lateral", new Bitmap(new ImagesResources.A44BitmapData(0, 0))));
        this.questions.set("A-45", new Question("Rua sem Saída", new Bitmap(new ImagesResources.A45BitmapData(0, 0))));
        this.questions.set("SA-blue1", new Question("Serviço Mecânico", new Bitmap(new ImagesResources.SABlue1BitmapData(0, 0))));
        this.questions.set("SA-blue2", new Question("Abastecimento", new Bitmap(new ImagesResources.SABlue2BitmapData(0, 0))));
        this.questions.set("SA-blue3", new Question("Serviço Sanitário", new Bitmap(new ImagesResources.SABlue3BitmapData(0, 0))));
        this.questions.set("SA-blue4", new Question("Restaurante", new Bitmap(new ImagesResources.SABlue4BitmapData(0, 0))));
        this.questions.set("SA-blue5", new Question("Hotel", new Bitmap(new ImagesResources.SABlue5BitmapData(0, 0))));
        this.questions.set("SA-blue6", new Question("Serviço Telefônico", new Bitmap(new ImagesResources.SABlue6BitmapData(0, 0))));
        this.questions.set("SA-blue7", new Question("Área de Campismo", new Bitmap(new ImagesResources.SABlue7BitmapData(0, 0))));
        this.questions.set("SA-blue8", new Question("Aeroporto", new Bitmap(new ImagesResources.SABlue8BitmapData(0, 0))));
        this.questions.set("SA-blue9", new Question("Estacionamento de Trailer", new Bitmap(new ImagesResources.SABlue9BitmapData(0, 0))));
        this.questions.set("SA-blue10", new Question("Área de Estacionamento", new Bitmap(new ImagesResources.SABlue10BitmapData(0, 0))));
        this.questions.set("SA-blue11", new Question("Transporte sobre Água", new Bitmap(new ImagesResources.SABlue11BitmapData(0, 0))));
        this.questions.set("SA-blue12", new Question("Ponto de Parada", new Bitmap(new ImagesResources.SABlue12BitmapData(0, 0))));
        this.questions.set("SA-blue13", new Question("Passagem protegida para Pedestres", new Bitmap(new ImagesResources.SABlue13BitmapData(0, 0))));
        this.questions.set("SA-blue14", new Question("Pronto Socorro", new Bitmap(new ImagesResources.SABlue14BitmapData(0, 0))));
        this.questions.set("I-green1", new Question("Sinal de Posicionamento de Localidades", new Bitmap(new ImagesResources.IGreen1BitmapData(0, 0))));
        this.questions.set("I-green2", new Question("Sinal de pré-indicação de Direção e Sentido para Saídas", new Bitmap(new ImagesResources.IGreen2BitmapData(0, 0))));
        this.questions.set("I-green3", new Question("Placa de localização", new Bitmap(new ImagesResources.IGreen3BitmapData(0, 0))));
        this.questions.set("I-green4", new Question("Pré-Indicação", new Bitmap(new ImagesResources.IGreen4BitmapData(0, 0))));
        this.questions.set("I-green5", new Question("Sinal de Indicação de Direção", new Bitmap(new ImagesResources.IGreen5BitmapData(0, 0))));
        this.questions.set("I-green6", new Question("Marcos Quilométricos", new Bitmap(new ImagesResources.IGreen6BitmapData(0, 0))));
        this.questions.set("I-azul1", new Question("Placa indicativa de sentido", new Bitmap(new ImagesResources.IAzul1BitmapData(0, 0))));
        this.questions.set("I-azul2", new Question("Placa de Identificação quilométrica", new Bitmap(new ImagesResources.IAzul2BitmapData(0, 0))));
        this.questions.set("I-azul3", new Question("Placa de Identificação de limite de Municípios, divisa de Estados, fronteira, perímetro urbano ", new Bitmap(new ImagesResources.IAzul3BitmapData(0, 0))));
        this.questions.set("I-branco1", new Question("Placa de Identificação - Rodovias e Estradas Pan-Americanas", new Bitmap(new ImagesResources.IBranco1BitmapData(0, 0))));
        this.questions.set("I-branco2", new Question("Placa de Identificação - Rodovias e Estradas Federais", new Bitmap(new ImagesResources.IBranco2BitmapData(0, 0))));
        this.questions.set("I-branco3", new Question("Placa de Identificação - Rodovias e Estradas Estaduais", new Bitmap(new ImagesResources.IBranco3BitmapData(0, 0))));

        this.index.push("R-1");
        this.index.push("R-2");
        this.index.push("R-3");
        this.index.push("R-4A");
        this.index.push("R-4B");
        this.index.push("R-5");
        this.index.push("R-6A");
        this.index.push("R-6B");
        this.index.push("R-6C");
        this.index.push("R-7");
        this.index.push("R-8");
        this.index.push("R-9");
        this.index.push("R-10");
        this.index.push("R-11");
        this.index.push("R-12");
        this.index.push("R-13");
        this.index.push("R-14");
        this.index.push("R-15");
        this.index.push("R-16");
        this.index.push("R-17");
        this.index.push("R-18");
        this.index.push("R-19");
        this.index.push("R-20");
        this.index.push("R-21");
        this.index.push("R-22");
        this.index.push("R-23");
        this.index.push("R-24A");
        this.index.push("R-24B");
        this.index.push("R-25A");
        this.index.push("R-25B");
        this.index.push("R-25C");
        this.index.push("R-25D");
        this.index.push("R-26");
        this.index.push("R-27");
        this.index.push("R-28");
        this.index.push("R-29");
        this.index.push("R-30");
        this.index.push("R-31");
        this.index.push("R-32");
        this.index.push("R-33");
        this.index.push("R-34");
        this.index.push("R-35A");
        this.index.push("R-35B");
        this.index.push("R-36A");
        this.index.push("R-36B");
        this.index.push("R-37");
        this.index.push("R-38");
        this.index.push("R-39");
        this.index.push("R-40");
        this.index.push("A-1a");
        this.index.push("A-1b");
        this.index.push("A-2a");
        this.index.push("A-2b");
        this.index.push("A-3a");
        this.index.push("A-3b");
        this.index.push("A-4a");
        this.index.push("A-4b");
        this.index.push("A-5a");
        this.index.push("A-5b");
        this.index.push("A-6");
        this.index.push("A-7a");
        this.index.push("A-7b");
        this.index.push("A-8");
        this.index.push("A-9");
        this.index.push("A-10a");
        this.index.push("A-10b");
        this.index.push("A-11a");
        this.index.push("A-11b");
        this.index.push("A-12");
        this.index.push("A-13a");
        this.index.push("A-13b");
        this.index.push("A-14");
        this.index.push("A-15");
        this.index.push("A-16");
        this.index.push("A-17");
        this.index.push("A-18");
        this.index.push("A-19");
        this.index.push("A-20a");
        this.index.push("A-20b");
        this.index.push("A-21a");
        this.index.push("A-21b");
        this.index.push("A-21c");
        this.index.push("A-22");
        this.index.push("A-23");
        this.index.push("A-24");
        this.index.push("A-25");
        this.index.push("A-26a");
        this.index.push("A-26b");
        this.index.push("A-27");
        this.index.push("A-28");
        this.index.push("A-29");
        this.index.push("A-30");
        this.index.push("A-31");
        this.index.push("A-32a");
        this.index.push("A-33a");
        this.index.push("A-33b");
        this.index.push("A-34");
        this.index.push("A-35");
        this.index.push("A-36");
        this.index.push("A-37");
        this.index.push("A-38");
        this.index.push("A-39");
        this.index.push("A-40");
        this.index.push("A-41");
        this.index.push("A-42a");
        this.index.push("A-42b");
        this.index.push("A-43");
        this.index.push("A-44");
        this.index.push("A-45");

        /*this.index.push("SA-blue1");
        this.index.push("SA-blue2");
        this.index.push("SA-blue3");
        this.index.push("SA-blue4");
        this.index.push("SA-blue5");
        this.index.push("SA-blue6");
        this.index.push("SA-blue7");
        this.index.push("SA-blue8");
        this.index.push("SA-blue9");
        this.index.push("SA-blue10");
        this.index.push("SA-blue11");
        this.index.push("SA-blue12");
        this.index.push("SA-blue13");
        this.index.push("SA-blue14");
        this.index.push("I-green1");
        this.index.push("I-green2");
        this.index.push("I-green3");
        this.index.push("I-green4");
        this.index.push("I-green5");
        this.index.push("I-green6");
        this.index.push("I-azul1");
        this.index.push("I-azul2");
        this.index.push("I-azul3");
        this.index.push("I-branco1");
        this.index.push("I-branco2");
        this.index.push("I-branco3");
        */
        Utils.shuffle(this.index);

    }
}
