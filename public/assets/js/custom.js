$(function () {
    "use strict";

    $(".preloader").fadeOut();
    // this is for close icon when navigation open in mobile view
    $(".nav-toggler").on('click', function () {
        $("#main-wrapper").toggleClass("show-sidebar");
        $(".nav-toggler i").toggleClass("ti-menu");
    });
    $(".search-box a, .search-box .app-search .srh-btn").on('click', function () {
        $(".app-search").toggle(200);
        $(".app-search input").focus();
    });

    // ============================================================== 
    // Resize all elements
    // ============================================================== 
    $("body, .page-wrapper").trigger("resize");
    $(".page-wrapper").delay(20).show();

    //****************************
    /* This is for the mini-sidebar if width is less then 1170*/
    //**************************** 
    var setsidebartype = function () {
        var width = (window.innerWidth > 0) ? window.innerWidth : this.screen.width;
        if (width < 1170) {
            $("#main-wrapper").attr("data-sidebartype", "mini-sidebar");
        } else {
            $("#main-wrapper").attr("data-sidebartype", "full");
        }
    };
    $(window).ready(setsidebartype);
    $(window).on("resize", setsidebartype);

    /** Button Back **/
    $('.btn-back').on('click', function(e) {
        e.preventDefault();
        history.go(-1);
    })

});

/**
 * Exibe uma mensagem de confirmação
 */
function confirme(msg, callback) {
    //var msg = "Você tem certeza que deseja excluir esse registro?";

    //Limpa outros modais semelhantes
    $('.modal-confirm').remove();

    //Monta o html
    var modalConfirm = $('<div></div>');
    modalConfirm.addClass('modal fade modal-confirm');
    modalConfirm.attr('tabindex', '4');
    modalConfirm.html('<div class="modal-dialog">\n\
        <div class="modal-content">\n\
          <div class="modal-header d-flex align-items-center">\n\
            <h4 class="modal-title" id="myLargeModalLabel">Atenção</h4>\n\
            <button type="button" class="close ml-auto" data-dismiss="modal" aria-hidden="true">×</button>\n\
          </div>\n\
          <div class="modal-body">\n\
            <p>'+ msg + '</p>\n\
          </div>\n\
          <div class="modal-footer">\n\
            <button type="button" class="btn btn-danger btn-cancelar" data-dismiss="modal">Cancelar</button>\n\
            <button type="button" class="btn btn-primary btn-confirmar" autofocus>Confirmar</button>\n\
          </div>\n\
        </div>\n\
      </div>');

    //Adiciona a modal à tela
    $('body').append(modalConfirm);
    $('.modal-confirm').modal();

    //Cria os eventos de click
    $('.modal-confirm button').click(function () {

        //Oculta a modal
        $('.modal-confirm').modal('toggle');

        //Devolve a resposta
        if ($(this).hasClass('btn-confirmar')) {
            callback(true);
        } else {
            callback(false);
        }
    });

    //Coloca o foco no botão de confirmação
    $('.modal-confirm').on('shown.bs.modal', function () {
        $(this).find('.btn-confirmar').focus();
    });
}

/**
 * Recupera os parâmetros da url
 */
function getParams() {
    var resp = {};
    if( window.location.search ) {
        var params = window.location.search.substr(1).split('&');
        for( i in params ) {
            var params2 = params[i].split('=');
            resp[params2[0]] = params2[1];
        }
    }

    return resp;
}

/**
 * Recupera um parâmetro da url
 */
function getParam(key) {
    var params = getParams();
    if( params[key] ) {
        return params[key];
    } else {
        null;
    }
}

/**
 * Bloqueia a tela e exibe a mensagem
 */
function wait(unblock) {
    if( !unblock ) {
        $("#pleaseWaitDialog").modal();
    } else {
        $("#pleaseWaitDialog").modal('hide');
    }
}

/**
 * Carrega a estrutura de filtros
 */
function carregarFiltros() {
    $('.filter').on('change', function() {
        filtrarGrid();
    });
}
function filtrarGrid() {
    var params = getParams();
    $('.filter').each(function() {
        var name  = $(this).attr('name');
        var value  = $(this).val();
        params[name] = value;
    });
    params['pagina'] = 1;
    var url = window.location.origin + window.location.pathname + "?" + $.param(params);
    window.location = url;
}