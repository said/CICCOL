<script type="text/javascript" charset="ISO-8859-1">
    //-------------------------------------------- Ação sobre o botão OK --------------------------------------

  $('#bt_ok_cad_curriculo').click(function(){

            //Pega os valores do formulário
            var perfil_profissional = $("#cad_curriculo_perfil_profissional").val();
            var ultimo_emprego = $("#cad_curriculo_ultimo_emprego").val();
            var cargo = $("#cad_curriculo_cargo").val();
            var id_curriculo = $("#cad_curriculo_id").val();
            var dt_criacao = $("#cad_cur_dt_criacao").val();

            var interesse = [];

            //Função para pegar os valores do segundo select
            $("#select2 option:selected").each(function() {
                interesse.push($(this).val());
            });
       

            //Armazena os valores do formulário na variável dataString
           var dataString = 'perfil_profissional=' + perfil_profissional + '&ultimo_emprego=' + ultimo_emprego + '&cargo=' + cargo + '&id_curriculo=' + id_curriculo + '&interesse=' + interesse + '&dt_criacao='+dt_criacao;


            //Defique qual action será passada na url
            if (id_curriculo=="")
                var opcao= 'inserir_curriculo';
            else
                var opcao='update_curriculo';

            //Envia a variável dataString para a lib que insere no banco de dados
            $.ajax({
                    type: "GET",
                    url: "libs/lib_cad_curriculo.php?reference=curriculo&action="+ opcao,
                    processData: false,
                    data: dataString,
                    //dataType: "html",
                    success: function(){
                      if(opcao=='inserir_curriculo')
                          alert("Currículo cadastrado com sucesso!");
                      else
                          alert("Currículo atualizado com sucesso!");
                    }
                });

    })

//------------------------------------ Ação sobre o botão Limpar ----------------------

$('#bt_limpar_cad_curriculo').click(function(){

    var id_curriculo = $("#cad_curriculo_id").val();

    if (id_curriculo=="")
    {
        //Limpa o formulário
        $('#form_cad_curriculo').each(function(){
                    this.reset();
        });
    }
    else
    {
        //Armazena os valores do formulário na variável dataString
        var dataString = 'id_curriculo=' + id_curriculo;

        var opcao='apagar_curriculo';

        //Envia a variável dataString para a lib que insere no banco de dados
            $.ajax({
                    type: "GET",
                    url: "libs/lib_cad_curriculo.php?reference=curriculo&action="+ opcao,
                    processData: false,
                    data: dataString,
                    //dataType: "html",
                    success: function(){
                       //Limpa o formulário
                       alert("Currículo apagado com sucesso!");
                      
                       $("#cad_curriculo_perfil_profissional").val("");
                       $("#cad_curriculo_ultimo_emprego").val("");
                       $("#cad_curriculo_cargo").val("");
                       $("#cad_curriculo_id").val("");
                       $("#cad_cur_dt_criacao").val("");

                    }
             });
    }

})


$('#add').click(function() {
      return !$('#select1 option:selected').remove().appendTo('#select2');
      
});

$('#remove').click(function() {
      return !$('#select2 option:selected').remove().appendTo('#select1');
});


</script>


<p class="heading">Cadastro de Currículo</p>

<!-- Formulário de cadastro e edição -->
<div id="cad_cur">
    <form class="dialog-form" id="form_cad_curriculo" >
        <fieldset class="ui-widget ui-widget-content ui-corner-all">
		<legend class="ui-widget ui-widget-header ui-corner-all">Currículo</legend>          

                    <p><!--{$dtAtualizacao}--></p><br/>
                    <label>Perfil Profissional</label>
                    <TEXTAREA type="text" name="cad_curriculo_perfil_profissional" id="cad_curriculo_perfil_profissional" class="text ui-widget-content ui-corner-all" COLS="35" ROWS="6"><!--{$perfil}--></TEXTAREA><br/><br/>

                    <label>Último Emprego</label>
                    <TEXTAREA type="text" name="cad_curriculo_ultimo_emprego" id="cad_curriculo_ultimo_emprego" class="text ui-widget-content ui-corner-all" COLS="35" ROWS="3"><!--{$ultEmprego}--></TEXTAREA><br/><br/>
                    

                    <label>Cargo Atual</label>
                    <select id="cad_curriculo_cargo" name="cad_curriculo_cargo">
                        <option><!--{$descCargo}--></option>
                        <!--{section name=cont_cargo loop=$cargo}-->
                        <option><!--{$cargo[cont_cargo].cargo}--></option>
                       <!--{/section}-->
                    </select><br/><br/><br/>

                    <label>Área de Interesse</label>
                    <table width="55%" cellspacing="12">
                        <tr><td align="center"><select multiple="multiple" id="select1" size="5" name="select1">
                            <!--{section name=cont_interesse loop=$interesse}-->
                                <option value="<!--{$interesse[cont_interesse].id}-->"><!--{$interesse[cont_interesse].interesse}--></option>
                            <!--{/section}-->
                            </select></td>
                    

                            <td align="center"><select multiple="multiple" id="select2" name="select2" size="5"></select></td>
                       </tr>

                        <tr><td align="center"><a href="#" id="add"><input type="button" value="ADD &gt;&gt;" id="add" title="OK" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only"></a></td>

                            <td align="center"><a href="#" id="remove"><input type="button" value="&lt;&lt; SUB" id="remove" title="OK" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only"></a></td>
                        </tr>
                    </table>


                    <input type="text" id="cad_curriculo_id" name="cad_curriculo_id" value="<!--{$idCurriculo}-->" style="display:none;" /><br/>
                    <input type="text" size="10" name="cad_cur_dt_criacao" id="cad_cur_dt_criacao" value="<!--{$dtCriacao}-->" style="display:none;" /><br/>

                    <div id="dialog-form_button">
                        <input type="button" value="OK" id="bt_ok_cad_curriculo" title="OK" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only">
                        <input type="button" value="Limpar" id="bt_limpar_cad_curriculo" title="Limpar" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only">
                    </div>
         </fieldset>
    </form>
  </div>








