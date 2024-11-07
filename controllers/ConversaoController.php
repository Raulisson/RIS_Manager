<?php
require_once __DIR__ . '/../vendor/autoload.php';
use PhpOffice\PhpSpreadsheet\IOFactory;

class ConversaoController extends AbstractController
{
// index
public function index()
{
    
    $db = Database::getConn();
    // Renderiza a view
    $this->render('conversao/ingressos', 'default');
}

public function conversao()
{
    // Verifica se os arquivos foram enviados
    if (isset($_FILES['arquivo_excel']) && isset($_FILES['arquivo_imagem'])) {

        // Caminhos temporários para os arquivos enviados
        $excelFilePath = $_FILES['arquivo_excel']['tmp_name'];
        $imageFilePath = $_FILES['arquivo_imagem']['tmp_name'];

        // Carrega a planilha Excel
        $spreadsheet = IOFactory::load($excelFilePath);
        $worksheet = $spreadsheet->getActiveSheet();

        // Pasta temporária para armazenar os PDFs gerados
        $pdfDir = '/tmp/pdfs/';
        if (!is_dir($pdfDir)) {
            mkdir($pdfDir, 0777, true);
        }

        // Obtém todas as linhas com conteúdo da primeira coluna
        $highestRow = $worksheet->getHighestDataRow('A');
        $codes = [];
        for ($row = 1; $row <= $highestRow; $row++) {
            $cellValue = $worksheet->getCell('A' . $row)->getValue();
            if (!empty($cellValue)) {
                $codes[] = $cellValue; // Armazena os códigos
            }
        }

        // Para cada código, criar um PDF com a imagem
        foreach ($codes as $index => $code) {
            // Criar o PDF
            $pdf = new TCPDF('L', 'mm', 'A4', true, 'UTF-8', false);
            $pdf->SetCreator(PDF_CREATOR);
            $pdf->SetAuthor('Sistema de Conversão');
            $pdf->SetTitle($code);
            $pdf->SetPrintHeader(false);
            $pdf->SetPrintFooter(false);
            $pdf->AddPage();
        
            // Dimensões da página A4 (paisagem)
            $pageWidth = 297;  // Largura da página em mm (A4 landscape)
            $pageHeight = 210; // Altura da página em mm (A4 landscape)
        
            // Tamanho da imagem que você quer adicionar
            $imageWidth = 192;  // Largura da imagem
            $imageHeight = 108; // Altura da imagem
        
            // Calcula as coordenadas para centralizar a imagem
            $x = ($pageWidth - $imageWidth) / 2;   // Centraliza horizontalmente
            $y = ($pageHeight - $imageHeight) / 2; // Centraliza verticalmente
        
            // Adicionar a imagem centralizada
            $pdf->Image($imageFilePath, $x, $y, $imageWidth, $imageHeight);
        
            // Adicionar o código no centro da imagem com cor branca
            $pdf->SetFont('helvetica', 'B', 20);
            $pdf->SetTextColor(255, 255, 255);
            $pdf->SetXY($x + 5, $y + ($imageHeight / 2) + 03);
            $pdf->Cell($imageWidth, 10, $code, 0, 1, 'C');
        
            // Salvar o PDF
            $pdfFilePath = $pdfDir . $code . '.pdf';
            $pdf->Output($pdfFilePath, 'F');
        }
        
        // Gerar o ZIP com todos os PDFs
        $zip = new ZipArchive();
        $zipFilePath = 'tmp/ingressos.zip';
        if ($zip->open($zipFilePath, ZipArchive::CREATE) === true) {
            foreach (glob($pdfDir . '*.pdf') as $pdfFile) {
                $zip->addFile($pdfFile, basename($pdfFile));
            }
            $zip->close();
        } else {
            echo 'Erro ao criar o arquivo ZIP.';
            return; // Encerra a execução se houver erro na criação do ZIP
        }

        // Verifica se o arquivo ZIP foi criado e está acessível
        if (file_exists($zipFilePath)) {
            // Download do arquivo ZIP
            header('Content-Type: application/zip');
            header('Content-Disposition: attachment; filename="ingressos.zip"');
            header('Content-Length: ' . filesize($zipFilePath));
            readfile($zipFilePath);

            // Limpar arquivos temporários
            array_map('unlink', glob($pdfDir . '*.pdf'));
            unlink($zipFilePath);
            echo 'Download do arquivo ZIP concluído com sucesso!';
        } else {
            echo 'Erro: o arquivo ZIP não foi encontrado.';
        }
    } else {
        echo 'Erro: os arquivos não foram enviados corretamente.';
    }
}

}
