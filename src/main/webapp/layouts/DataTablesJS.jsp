<%--
  Created by IntelliJ IDEA.
  User: pccom
  Date: 20/08/2023
  Time: 04:59 p. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src="https://cdn.datatables.net/1.13.6/js/dataTables.bootstrap5.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.10.1/jszip.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.2.7/pdfmake.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.2.7/vfs_fonts.js"></script>
<script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.13.6/js/dataTables.bootstrap5.min.js"></script>
<script src="https://cdn.datatables.net/buttons/2.4.1/js/dataTables.buttons.min.js"></script>
<script src="https://cdn.datatables.net/buttons/2.4.1/js/buttons.bootstrap5.min.js"></script>
<script src="https://cdn.datatables.net/buttons/2.4.1/js/buttons.colVis.min.js"></script>
<script src="https://cdn.datatables.net/buttons/2.4.1/js/buttons.html5.min.js"></script>
<script src="https://cdn.datatables.net/buttons/2.4.1/js/buttons.print.min.js"></script>
<script>
  $(document).ready(function () {
    $('#example2').DataTable({
      lengthMenu: [5, 10, 20, 50, 100],
      dom: 'Bfrtilp',
      buttons: [
        {
          extend: 'excelHtml5',
          text: "<i class='bi bi-file-earmark-spreadsheet'></i>",
          title: "Exportar a Excel",
          className: "btn btn-success",
        },
        {
          extend: 'pdfHtml5',
          text: "<i class='bi bi-filetype-pdf'></i>",
          title: "Exportar a PDF",
          className: "btn btn-danger",
        },
        {
          extend: 'print',
          text: "<i class='bi bi-printer'></i>",
          title: "Imprimir",
          className: "btn btn-close-white",
        },
      ],
      language: {
        url: '//cdn.datatables.net/plug-ins/1.13.6/i18n/es-ES.json',
      },
    });
  });
</script>
<script>
    $(document).ready(function () {
        $('#example').DataTable({
            lengthMenu: [5, 10, 20, 50, 100],
            dom: 'Bfrtilp',
            buttons: [
                {
                    extend: 'excelHtml5',
                    text: "<i class='bi bi-file-earmark-spreadsheet'></i>",
                    title: "Exportar a Excel",
                    className: "btn btn-success",
                },
                {
                    extend: 'pdfHtml5',
                    text: "<i class='bi bi-filetype-pdf'></i>",
                    title: "Exportar a PDF",
                    className: "btn btn-danger",
                },
                {
                    extend: 'print',
                    text: "<i class='bi bi-printer'></i>",
                    title: "Imprimir",
                    className: "btn btn-close-white",
                },
            ],
            language: {
                url: '//cdn.datatables.net/plug-ins/1.13.6/i18n/es-ES.json',
            },
        });
    });
</script>