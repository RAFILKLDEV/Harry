require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_HarryFicha()
    local obj = GUI.fromHandle(_obj_newObject("form"));
    local self = obj;
    local sheet = nil;

    rawset(obj, "_oldSetNodeObjectFunction", obj.setNodeObject);

    function obj:setNodeObject(nodeObject)
        sheet = nodeObject;
        self.sheet = nodeObject;
        self:_oldSetNodeObjectFunction(nodeObject);
    end;

    function obj:setNodeDatabase(nodeObject)
        self:setNodeObject(nodeObject);
    end;

    _gui_assignInitialParentForForm(obj.handle);
    obj:beginUpdate();
    obj:setFormType("sheetTemplate");
    obj:setDataType("HarryPlugin");
    obj:setHeight(550);
    obj:setWidth(1080);
    obj:setTitle("Ficha Harry Potter Nova!");
    obj:setName("HarryFicha");




          local function TotalPericia(ATR, MOD, OUT)
          local total = 0

          total = ATR + MOD + OUT

          return total
          end

     



          local function cadaDez(numero)
               local result = -1

               while numero >= 0 do
                    result = result + 1
                    numero = numero - 10
               end

               return result
          end
     




     


    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj);
    obj.dataLink1:setFields({'AGI','DES', 'FOR','LUT','VIG','INTE','PRE','SAB','ACR_Grad','ACR_Out','ATL_Grad',
          'ATL_Out','COR_Grad','COR_Out','ENG_Grad', 'ENG_Out','FUR_Grad','FUR_Out','PRE_Grad','PRE_Out','VEI_Grad','VEI_Out',
          'CON_Grad','CON_Out','INT_Grad','INT_Out','INTU_Grad','INTU_Out','INV_Grad','INV_Out','PERC_Grad','PERC_Out','PERS_Grad','PERS_Out',
          'TRA_Grad','TRA_Out','ATU_Grad','ATU_Out','C_ADI_Grad','C_ADI_Out','C_AZA_Grad','C_AZA_Out','C_CON_Grad','C_CON_Out',
          'C_CRI_Grad','C_CRI_Out','C_ENC_Grad','C_ENC_Out','C_FEI_Grad','C_FEI_Out','C_HER_Grad','C_HER_Out','C_MAL_Grad','C_MAL_Out','C_POC_Grad','C_POC_Out',
          'C_RUN_Grad','C_RUN_Out','C_TRA_Grad','C_TRA_Out', 'INI_Grad', 'INI_Out', 'APA_Grad','APA_Out', 'FORT_Grad', 'FORT_Out',
          'REF_Grad', 'REF_Out', 'RES_Grad', 'RES_Out', 'VON_Grad', 'VON_Out', 'ANTE_QUAD_OUT', 'APAN_QUAD_OUT', 'ATRA_QUAD_OUT', 'DRI_QUAD_OUT', 'GOL_QUAD_OUT',
          'FALTA_QUAD_OUT', 'PASS_QUAD_OUT', 'REBA_QUAD_OUT', 'ROU_QUAD_OUT' , 'VEL_QUAD_OUT', 'DEFE_QUAD_GRAD' , 'DEFE_QUAD_OUT' });
    obj.dataLink1:setName("dataLink1");

    obj.tabControl1 = GUI.fromHandle(_obj_newObject("tabControl"));
    obj.tabControl1:setParent(obj);
    obj.tabControl1:setAlign("client");
    obj.tabControl1:setName("tabControl1");

    obj.tab1 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab1:setParent(obj.tabControl1);
    obj.tab1:setTitle("Feitiços");
    obj.tab1:setName("tab1");


      -- Primeiro, é necessário usar a unidade "dialogs.lua"
      require("dialogs.lua");
      require("ndb.lua")
      require("utils.lua");
      require("gui.lua");

      local function condition(tipo)

      if tipo == "fisico" then

      if sheet.Exausto then
      return -5
      end

      if sheet.Fadigado then
      return -2
      end

      elseif tipo == "mental" then

      if sheet.Tiltado then
      return -5
      end

      if sheet.Frustrado then
      return -2
      end

      end

      return nil
      end

      local function testezz()

      showMessage(node.soundControl)

      end

      local function tocarAudio()
      require("utils.lua");

      local minhaMesa = Firecast.getRoomOf(sheet);
      local node = NDB.getRoot(sheet)

      if node.soundControl == "ligado" then

      if sheet.Sound ~= nil then
      local track = "/audios/" .. sheet.Sound
      minhaMesa.audioPlayer:play(track,0.8)
      end

      end

      end

      local function Aceitar()
      Dialogs.confirmOkCancel("Deseja Apagar esse Feitiço ?",
      function (confirmado)
      if confirmado then
      local node = self.boxDetalhesDoItem.node
      NDB.deleteNode(node);
      else
      return
      end;
      end);

      end
   



         local function definirEscola()
            if sheet.escola == 'Adivinhação' then
            return sheet.C_ADI_Total
            elseif sheet.escola == 'Azaração' then
            return sheet.C_AZA_Total
            elseif sheet.escola == 'Contra-Feitiço' then
            return sheet.C_CON_Total
            elseif sheet.escola == 'Encantamento' then
            return sheet.C_ENC_Total
            elseif sheet.escola == 'Feitiço' then
            return sheet.C_FEI_Total
            elseif sheet.escola == 'Transmutação' then
            return sheet.C_TRA_Total
            elseif sheet.escola == 'Maldição' then
            return sheet.C_MAL_Total
            end

            end

            local function stats()
            local msg = ""

            if sheet.Grad ~= "" then
            msg = msg .. "[§K10]" .. "Grad: " .. "[§K1]" .. ((sheet.Grad) or "")
            else
            end

            if sheet.CD ~= "" then
            msg = msg .. "[§K10]" .. " CD: " .. "[§K1]" .. ((sheet.CD) or "")
            else
            end

            if sheet.Dano ~= "" then
            msg = msg .. "[§K10]" .. " Dano: " .. "[§K1]" .. ((sheet.Dano) or "")
            else
            end

            if sheet.Poder ~= "" then
            msg = msg .. "[§K10]" .. " Poder: " .. "[§K1]" .. ((sheet.Poder) or "")
            else
            end

            -- if sheet.Bonus ~= "" then
            -- msg = msg .. "[§K10]" .. " Bonus: " .. "[§K1]" .. ((sheet.Bonus) or "")
            -- else
            -- end

            if sheet.Range ~= "" then
            msg = msg .. "[§K10]" .. " Range: " .. "[§K1]" .. ((sheet.Range) or "")
            else
            end

            if sheet.Area ~= "" then
            msg = msg .. "[§K10]" .. " Area: " .. "[§K1]" .. ((sheet.Area) or "")
            else
            end

            if sheet.Duracao ~= "" then
            msg = msg .. "[§K10]" .. " Duração: " .. "[§K1]" .. ((sheet.Duracao) or "")
            else
            end

            return msg
            end

         local function rolarFeitico()
            local minhaMesa = Firecast.getRoomOf(sheet);
            local chat = minhaMesa.chat;
            local nick = minhaMesa.meuJogador.nick
            local dataScope = self.boxDetalhesDoItem.node
            local somatoria = sheet.Grad .. "+" .. math.floor(definirEscola() / 2) .. "-" .. (sheet.concentracao or 0)

            chat:enviarMensagem("Nome:" .. (sheet.nome or "NIL") .. " CD " .. (sheet.CD or "NIL") .. " Grad" .. (sheet.Grad or "NIL") .. " Poder" .. (sheet.Poder or "NIL") .. " Range" .. (sheet.Range or "NIL") .. " Area" .. (sheet.Area or "NIL") .. " Duração" .. (sheet.Duracao or "NIL") .. " Dano " .. (sheet.Dano or "NIL") .. " Bonus " .. (sheet.Bonus or "NIL"));

            chat:enviarMensagem("----------------");

            chat:rolarDados("1d20+" .. somatoria, "Cast " ..
            sheet.nome .. " CD " .. sheet.CD, function
               (rolagem)

               if rolagem.resultado >= tonumber(sheet.CD) then
               chat:enviarMensagem("[§K10]" .. nick .. "[§K1] esta castando [§K6]" .. sheet.nome .. "[§K9] Sucesso!")

               chat:enviarMensagem("[§K6]" .. sheet.nome .. " " .. stats())

               if sheet.Efeito then
               chat:enviarMensagem("[§K10]Efeito: " .. "[§K1]" .. sheet.Efeito)
               end

               if sheet.tipo == 'Ataque' then
               chat:rolarDados("1d20+" .. sheet.Grad .. "+" .. sheet.DES .. "-" .. (sheet.acerto or 0) ..
               (condition("fisico") or ""),
               "Ataque de " .. sheet.nome)
               setTimeout(tocarAudio, 5000)

               elseif sheet.tipo == 'Ataque Base' then
               chat:rolarDados("1d20+" .. sheet.Grad .. "+" .. sheet.DES .. "-" .. (sheet.acerto or 0) ..
               (condition("fisico") or ""),
               "Ataque de " .. sheet.nome)
               setTimeout(tocarAudio, 5000)

               elseif sheet.tipo == 'Defesa' then
               chat:rolarDados("1d8+" .. sheet.Poder .. "+" .. sheet.Bonus ..
               (condition("fisico") or ""), "CA " .. sheet.nome)
               setTimeout(tocarAudio, 5000)
               end

               chat:enviarMensagem("----------------");

               elseif rolagem.resultado < tonumber(sheet.CD) and rolagem.resultado >
               tonumber(sheet.CD)
               - 5 then
               chat:enviarMensagem(sheet.nome .. "[§K4] Falhou em 1 Estagio!!");

               elseif rolagem.resultado < tonumber(sheet.CD) and rolagem.resultado >
               tonumber(sheet.CD)
               - 10 then
               chat:enviarMensagem(sheet.nome .. "[§K4] Falhou em 2 Estagio!!");

               elseif rolagem.resultado < tonumber(sheet.CD) and rolagem.resultado >
               tonumber(sheet.CD)
               - 15 then
               chat:enviarMensagem(sheet.nome .. "[§K4] Falhou em 3 Estagio!!");

               else chat:enviarMensagem(sheet.nome .. "[§K4] Falhou em 4 Estagio!!");

               end

               end)

         end

   



      local function abrirPopUp()

      local controle = self:findControlByName("popUp");
      local Raiz = NDB.load("listfetico.xml");
      local Filho = NDB.getChildNodes(Raiz);
      local node = NDB.getRoot(sheet)
      
      controle.visible = true
      
      ListaFeiticos = {}
      ListaNomesFeitico = {}

      for i = 1, #Filho, 1 do
      ListaFeiticos[i] = Raiz["f" .. i]
      ListaNomesFeitico[i] = Raiz["f" .. i].nome
      table.sort(ListaNomesFeitico)
      end

      for k = 1, #Filho, 1 do

      if sheet.nome == ListaFeiticos[k].nome then

      node.escola2 = ListaFeiticos[k].escola
      node.tipo2 = ListaFeiticos[k].cast
      node.Efeito2 = ListaFeiticos[k].efeito
      node.Grad2 = totable(ListaFeiticos[k].gradArray)[1]
      node.CD2 = totable(ListaFeiticos[k].cdfArray)[1]
      node.Dano2 = totable(ListaFeiticos[k].danoArray)[1]
      node.Poder2 = totable(ListaFeiticos[k].poderArray)[1]
      node.Range2 = totable(ListaFeiticos[k].rangeArray)[1]
      node.Area2 = totable(ListaFeiticos[k].areaArray)[1]
      node.Duracao2 = totable(ListaFeiticos[k].duracaoArray)[1]

      node.escola = sheet.escola
      node.tipo = sheet.tipo
      node.Grad = sheet.Grad
      node.CD = sheet.CD
      node.Dano = sheet.Dano
      node.Poder = sheet.Poder
      node.Range = sheet.Range
      node.Area = sheet.Area
      node.Duracao = sheet.escola

      node.Desc = ListaFeiticos[k].desc
      node.Efeito = ListaFeiticos[k].efeito
      node.Bonus = ListaFeiticos[k].bonus

      end
      end

      end

   



      local function importarFeitico()
         require("utils.lua");
         local Raiz = NDB.load("listfetico.xml");
         local Filho = NDB.getChildNodes(Raiz);
         local node = self.rclFeiticos.selectedNode;
   
         ListaFeiticos = {} -- new array
         ListaNomesFeitico = {} -- new array
   
         for i = 1, #Filho, 1 do
            ListaFeiticos[i] = Raiz["f" .. i]
            ListaNomesFeitico[i] = Raiz["f" .. i].nome
            table.sort(ListaNomesFeitico)
         end
   
         Dialogs.choose("Selecione uma das opções", ListaNomesFeitico,
         function(selected, selectedIndex, selectedText)
            if selected then
               for k = 1, #Filho, 1 do
                  if tostring(selectedText) == ListaFeiticos[k].nome then	
                    
										node.nome = ListaFeiticos[k].nome
										node.escola = ListaFeiticos[k].escola
										node.defesa = ListaFeiticos[k].defesa
										node.tipo = ListaFeiticos[k].cast
										node.Efeito = ListaFeiticos[k].efeito
										node.Desc = ListaFeiticos[k].desc
							
										node.Grad = totable(ListaFeiticos[k].gradArray)[1]
										node.Grad_name = "Grad"
										node.Grad_grad = 1
										node.Grad_array = ListaFeiticos[k].gradArray
							
										node.CD = totable(ListaFeiticos[k].cdfArray)[1]
										node.CD_name = "CD"
										node.CD_grad = 1
										node.CD_array = ListaFeiticos[k].cdfArray
							
										node.Dano = totable(ListaFeiticos[k].danoArray)[1]
										node.Dano_name = "Dano"
										node.Dano_grad = 1
										node.Dano_array = ListaFeiticos[k].danoArray
							
										node.Poder = totable(ListaFeiticos[k].poderArray)[1]
										node.Poder_name = "Poder"
										node.Poder_grad = 1
										node.Poder_array = ListaFeiticos[k].poderArray
							
										node.Range = totable(ListaFeiticos[k].rangeArray)[1]
										node.Range_name = "Range"
										node.Range_grad = 1
										node.Range_array = ListaFeiticos[k].rangeArray
							
										node.Area = totable(ListaFeiticos[k].areaArray)[1]
										node.Area_name = "Area"
										node.Area_grad = 1
										node.Area_array = ListaFeiticos[k].areaArray
							
										node.Duracao = totable(ListaFeiticos[k].duracaoArray)[1]
										node.Duracao_name = "Duracao"
										node.Duracao_grad = 1
										node.Duracao_array = ListaFeiticos[k].duracaoArray
                  end
              end
            end;

          end)
      end
   


    obj.scrollBox1 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj.tab1);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.image1 = GUI.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.scrollBox1);
    obj.image1:setStyle("autoFit");
    obj.image1:setTop(0);
    obj.image1:setWidth(1300);
    obj.image1:setHeight(800);
    obj.image1:setSRC("/imagens/wizard.jpg");
    obj.image1:setName("image1");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.scrollBox1);
    obj.layout1:setAlign("top");
    obj.layout1:setHeight(100);
    obj.layout1:setPadding({top=5, left=5});
    obj.layout1:setName("layout1");


            local function onChange(node, attribute, oldValue)
            showMessage(oldValue)

            end

            local function alternarFeiticos()

            if self.rclFeiticos.visible == true then
            self.botao.text = "Lista Completa"
            self.rclFeiticos.visible = false
            self.testezim.visible = true
            else
            self.botao.text = "Lista Simplificada"
            self.rclFeiticos.visible = true
            self.testezim.visible = false
            end

            end

            local function alternarAudio()
            local node = NDB.getRoot(sheet)

            if self.sound.text == "🔊" then
            self.sound.text = "🔇"
            node.soundControl = "desligado"
            else
            self.sound.text = "🔊"
            node.soundControl = "ligado"
            end

            end

            local function adicionarFeitico()

            local node = self.rclFeiticos:append();

            node.nome = "Importar"
            node.escola = "-"
            node.tipo = "-"
            node.Efeito = "-"

            node.Grad = 0
            node.Grad_name = "Grad"
            node.Grad_grad = 1
            node.Grad_array = {0}

            node.CD = "-"
            node.CD_name = "CD"
            node.CD_grad = 1
            node.CD_array = {0}

            node.Dano = "-"
            node.Dano_name = "Dano"
            node.Dano_grad = 1
            node.Dano_array = {"-"}

            node.Poder = "-"
            node.Poder_name = "Poder"
            node.Poder_grad = 1
            node.Poder_array = {"-"}

            node.Range = "-"
            node.Range_name = "Range"
            node.Range_grad = 1
            node.Range_array = {"-"}

            node.Area = "-"
            node.Area_name = "Area"
            node.Area_grad = 1
            node.Area_array = {"-"}

            node.Duracao = "-"
            node.Duracao_name = "Duracao"
            node.Duracao_grad = 1
            node.Duracao_array = {"-"}

            end
         


    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.layout1);
    obj.layout2:setAlign("top");
    obj.layout2:setHeight(70);
    obj.layout2:setMargins({top=10, left=0});
    obj.layout2:setName("layout2");

    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.layout2);
    obj.layout3:setAlign("left");
    obj.layout3:setMargins({left=20});
    obj.layout3:setWidth(120);
    obj.layout3:setHeight(70);
    obj.layout3:setName("layout3");

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.layout3);
    obj.rectangle1:setTop(5);
    obj.rectangle1:setLeft(10);
    obj.rectangle1:setColor("#C59E01");
    obj.rectangle1:setWidth(90);
    obj.rectangle1:setHeight(25);
    obj.rectangle1:setName("rectangle1");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.rectangle1);
    obj.label1:setAlign("client");
    obj.label1:setText("Destreza");
    obj.label1:setHorzTextAlign("center");
    obj.label1:setName("label1");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout3);
    obj.edit1:setTop(30);
    obj.edit1:setWidth(120);
    obj.edit1:setField("DES");
    obj.edit1:setReadOnly(true);
    obj.edit1:setHorzTextAlign("center");
    obj.edit1:setType("number");
    obj.edit1:setMin(0);
    obj.edit1:setName("edit1");

    obj.layout4 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.layout2);
    obj.layout4:setAlign("left");
    obj.layout4:setMargins({left=20});
    obj.layout4:setWidth(120);
    obj.layout4:setHeight(70);
    obj.layout4:setName("layout4");

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.layout4);
    obj.rectangle2:setTop(5);
    obj.rectangle2:setLeft(10);
    obj.rectangle2:setColor("DarkSlateBlue");
    obj.rectangle2:setWidth(90);
    obj.rectangle2:setHeight(25);
    obj.rectangle2:setName("rectangle2");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.rectangle2);
    obj.label4:setAlign("client");
    obj.label4:setText("Adivinhação");
    obj.label4:setHorzTextAlign("center");
    obj.label4:setName("label4");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.layout4);
    obj.edit2:setTop(30);
    obj.edit2:setWidth(120);
    obj.edit2:setField("C_ADI_Total");
    obj.edit2:setReadOnly(true);
    obj.edit2:setHorzTextAlign("center");
    obj.edit2:setType("number");
    obj.edit2:setMin(0);
    obj.edit2:setName("edit2");

    obj.layout5 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.layout2);
    obj.layout5:setAlign("left");
    obj.layout5:setMargins({left=20});
    obj.layout5:setWidth(120);
    obj.layout5:setHeight(70);
    obj.layout5:setName("layout5");

    obj.rectangle3 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.layout5);
    obj.rectangle3:setTop(5);
    obj.rectangle3:setLeft(10);
    obj.rectangle3:setColor("DarkSlateBlue");
    obj.rectangle3:setWidth(90);
    obj.rectangle3:setHeight(25);
    obj.rectangle3:setName("rectangle3");

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.rectangle3);
    obj.label5:setAlign("client");
    obj.label5:setText("Azaração");
    obj.label5:setHorzTextAlign("center");
    obj.label5:setName("label5");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.layout5);
    obj.edit3:setTop(30);
    obj.edit3:setWidth(120);
    obj.edit3:setField("C_AZA_Total");
    obj.edit3:setReadOnly(true);
    obj.edit3:setHorzTextAlign("center");
    obj.edit3:setType("number");
    obj.edit3:setMin(0);
    obj.edit3:setName("edit3");

    obj.layout6 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.layout2);
    obj.layout6:setAlign("left");
    obj.layout6:setMargins({left=20});
    obj.layout6:setWidth(120);
    obj.layout6:setHeight(70);
    obj.layout6:setName("layout6");

    obj.rectangle4 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.layout6);
    obj.rectangle4:setTop(5);
    obj.rectangle4:setLeft(10);
    obj.rectangle4:setColor("DarkSlateBlue");
    obj.rectangle4:setWidth(90);
    obj.rectangle4:setHeight(25);
    obj.rectangle4:setName("rectangle4");

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.rectangle4);
    obj.label6:setAlign("client");
    obj.label6:setText("Contra-Feitiço");
    obj.label6:setHorzTextAlign("center");
    obj.label6:setName("label6");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.layout6);
    obj.edit4:setTop(30);
    obj.edit4:setWidth(120);
    obj.edit4:setField("C_CON_Total");
    obj.edit4:setReadOnly(true);
    obj.edit4:setHorzTextAlign("center");
    obj.edit4:setType("number");
    obj.edit4:setMin(0);
    obj.edit4:setName("edit4");

    obj.layout7 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.layout2);
    obj.layout7:setAlign("left");
    obj.layout7:setMargins({left=20});
    obj.layout7:setWidth(120);
    obj.layout7:setHeight(70);
    obj.layout7:setName("layout7");

    obj.rectangle5 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle5:setParent(obj.layout7);
    obj.rectangle5:setTop(5);
    obj.rectangle5:setLeft(10);
    obj.rectangle5:setColor("DarkSlateBlue");
    obj.rectangle5:setWidth(90);
    obj.rectangle5:setHeight(25);
    obj.rectangle5:setName("rectangle5");

    obj.label7 = GUI.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.rectangle5);
    obj.label7:setAlign("client");
    obj.label7:setText("Encantamento");
    obj.label7:setHorzTextAlign("center");
    obj.label7:setName("label7");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.layout7);
    obj.edit5:setTop(30);
    obj.edit5:setWidth(120);
    obj.edit5:setField("C_ENC_Total");
    obj.edit5:setReadOnly(true);
    obj.edit5:setHorzTextAlign("center");
    obj.edit5:setType("number");
    obj.edit5:setMin(0);
    obj.edit5:setName("edit5");

    obj.layout8 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.layout2);
    obj.layout8:setAlign("left");
    obj.layout8:setMargins({left=20});
    obj.layout8:setWidth(120);
    obj.layout8:setHeight(70);
    obj.layout8:setName("layout8");

    obj.rectangle6 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle6:setParent(obj.layout8);
    obj.rectangle6:setTop(5);
    obj.rectangle6:setLeft(10);
    obj.rectangle6:setColor("DarkSlateBlue");
    obj.rectangle6:setWidth(90);
    obj.rectangle6:setHeight(25);
    obj.rectangle6:setName("rectangle6");

    obj.label8 = GUI.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.rectangle6);
    obj.label8:setAlign("client");
    obj.label8:setText("Feitiço");
    obj.label8:setHorzTextAlign("center");
    obj.label8:setName("label8");

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.layout8);
    obj.edit6:setTop(30);
    obj.edit6:setWidth(120);
    obj.edit6:setField("C_FEI_Total");
    obj.edit6:setReadOnly(true);
    obj.edit6:setHorzTextAlign("center");
    obj.edit6:setType("number");
    obj.edit6:setMin(0);
    obj.edit6:setName("edit6");

    obj.layout9 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout9:setParent(obj.layout2);
    obj.layout9:setAlign("left");
    obj.layout9:setMargins({left=20});
    obj.layout9:setWidth(120);
    obj.layout9:setHeight(70);
    obj.layout9:setName("layout9");

    obj.rectangle7 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle7:setParent(obj.layout9);
    obj.rectangle7:setTop(5);
    obj.rectangle7:setLeft(10);
    obj.rectangle7:setColor("DarkSlateBlue");
    obj.rectangle7:setWidth(90);
    obj.rectangle7:setHeight(25);
    obj.rectangle7:setName("rectangle7");

    obj.label9 = GUI.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.rectangle7);
    obj.label9:setAlign("client");
    obj.label9:setText("Transmutação");
    obj.label9:setHorzTextAlign("center");
    obj.label9:setName("label9");

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.layout9);
    obj.edit7:setTop(30);
    obj.edit7:setWidth(120);
    obj.edit7:setField("C_TRA_Total");
    obj.edit7:setReadOnly(true);
    obj.edit7:setHorzTextAlign("center");
    obj.edit7:setType("number");
    obj.edit7:setMin(0);
    obj.edit7:setName("edit7");

    obj.layout10 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout10:setParent(obj.layout2);
    obj.layout10:setAlign("left");
    obj.layout10:setMargins({left=20});
    obj.layout10:setWidth(120);
    obj.layout10:setHeight(70);
    obj.layout10:setName("layout10");

    obj.rectangle8 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle8:setParent(obj.layout10);
    obj.rectangle8:setTop(5);
    obj.rectangle8:setLeft(10);
    obj.rectangle8:setColor("DarkSlateBlue");
    obj.rectangle8:setWidth(90);
    obj.rectangle8:setHeight(25);
    obj.rectangle8:setName("rectangle8");

    obj.label10 = GUI.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.rectangle8);
    obj.label10:setAlign("client");
    obj.label10:setText("Arte das Trevas");
    obj.label10:setHorzTextAlign("center");
    obj.label10:setName("label10");

    obj.edit8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.layout10);
    obj.edit8:setTop(30);
    obj.edit8:setWidth(120);
    obj.edit8:setField("C_MAL_Total");
    obj.edit8:setReadOnly(true);
    obj.edit8:setHorzTextAlign("center");
    obj.edit8:setType("number");
    obj.edit8:setMin(0);
    obj.edit8:setName("edit8");

    obj.layout11 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout11:setParent(obj.scrollBox1);
    obj.layout11:setAlign("top");
    obj.layout11:setHeight(80);
    obj.layout11:setMargins({top=0, left=0});
    obj.layout11:setName("layout11");

    obj.layout12 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout12:setParent(obj.layout11);
    obj.layout12:setAlign("left");
    obj.layout12:setMargins({left=20});
    obj.layout12:setWidth(120);
    obj.layout12:setHeight(80);
    obj.layout12:setName("layout12");

    obj.rectangle9 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle9:setParent(obj.layout12);
    obj.rectangle9:setTop(5);
    obj.rectangle9:setLeft(10);
    obj.rectangle9:setColor("#6B8E23");
    obj.rectangle9:setWidth(90);
    obj.rectangle9:setHeight(25);
    obj.rectangle9:setName("rectangle9");

    obj.label11 = GUI.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.rectangle9);
    obj.label11:setAlign("client");
    obj.label11:setText("Fisico");
    obj.label11:setHorzTextAlign("center");
    obj.label11:setName("label11");

    obj.edit9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.layout12);
    obj.edit9:setTop(30);
    obj.edit9:setWidth(120);
    obj.edit9:setField("fisico");
    obj.edit9:setHorzTextAlign("center");
    obj.edit9:setType("float");
    obj.edit9:setName("edit9");

    obj.dataLink2 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj.layout12);
    obj.dataLink2:setField("fisico");
    obj.dataLink2:setName("dataLink2");

    obj.layout13 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout13:setParent(obj.layout11);
    obj.layout13:setAlign("left");
    obj.layout13:setMargins({left=20});
    obj.layout13:setWidth(120);
    obj.layout13:setHeight(80);
    obj.layout13:setName("layout13");

    obj.rectangle10 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle10:setParent(obj.layout13);
    obj.rectangle10:setTop(5);
    obj.rectangle10:setLeft(10);
    obj.rectangle10:setColor("#6B8E23");
    obj.rectangle10:setWidth(90);
    obj.rectangle10:setHeight(25);
    obj.rectangle10:setName("rectangle10");

    obj.label12 = GUI.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.rectangle10);
    obj.label12:setAlign("client");
    obj.label12:setText("Mental");
    obj.label12:setHorzTextAlign("center");
    obj.label12:setName("label12");

    obj.edit10 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.layout13);
    obj.edit10:setTop(30);
    obj.edit10:setWidth(120);
    obj.edit10:setField("mental");
    obj.edit10:setHorzTextAlign("center");
    obj.edit10:setType("float");
    obj.edit10:setName("edit10");

    obj.dataLink3 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink3:setParent(obj.layout13);
    obj.dataLink3:setField("mental");
    obj.dataLink3:setName("dataLink3");

    obj.layout14 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout14:setParent(obj.layout11);
    obj.layout14:setAlign("left");
    obj.layout14:setMargins({left=20});
    obj.layout14:setWidth(120);
    obj.layout14:setHeight(70);
    obj.layout14:setName("layout14");

    obj.rectangle11 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle11:setParent(obj.layout14);
    obj.rectangle11:setTop(5);
    obj.rectangle11:setLeft(10);
    obj.rectangle11:setColor("purple");
    obj.rectangle11:setWidth(90);
    obj.rectangle11:setHeight(25);
    obj.rectangle11:setName("rectangle11");

    obj.label13 = GUI.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.rectangle11);
    obj.label13:setAlign("client");
    obj.label13:setText("Concentração");
    obj.label13:setHorzTextAlign("center");
    obj.label13:setName("label13");

    obj.edit11 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.layout14);
    obj.edit11:setTop(30);
    obj.edit11:setWidth(120);
    obj.edit11:setField("concentracao");
    obj.edit11:setReadOnly(false);
    obj.edit11:setHorzTextAlign("center");
    obj.edit11:setType("number");
    obj.edit11:setMin(0);
    obj.edit11:setName("edit11");

    obj.layout15 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout15:setParent(obj.layout11);
    obj.layout15:setAlign("left");
    obj.layout15:setMargins({left=20});
    obj.layout15:setWidth(120);
    obj.layout15:setHeight(70);
    obj.layout15:setName("layout15");

    obj.rectangle12 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle12:setParent(obj.layout15);
    obj.rectangle12:setTop(5);
    obj.rectangle12:setLeft(10);
    obj.rectangle12:setColor("purple");
    obj.rectangle12:setWidth(90);
    obj.rectangle12:setHeight(25);
    obj.rectangle12:setName("rectangle12");

    obj.label14 = GUI.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.rectangle12);
    obj.label14:setAlign("client");
    obj.label14:setText("Acerto");
    obj.label14:setHorzTextAlign("center");
    obj.label14:setName("label14");

    obj.edit12 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.layout15);
    obj.edit12:setTop(30);
    obj.edit12:setWidth(120);
    obj.edit12:setField("acerto");
    obj.edit12:setReadOnly(false);
    obj.edit12:setHorzTextAlign("center");
    obj.edit12:setType("number");
    obj.edit12:setMin(0);
    obj.edit12:setName("edit12");

    obj.aqui = GUI.fromHandle(_obj_newObject("layout"));
    obj.aqui:setParent(obj.scrollBox1);
    obj.aqui:setName("aqui");
    obj.aqui:setAlign("top");
    obj.aqui:setHeight(600);
    obj.aqui:setPadding({top=5, left=5});

    obj.layout16 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout16:setParent(obj.aqui);
    obj.layout16:setLeft(20);
    obj.layout16:setTop(15);
    obj.layout16:setWidth(600);
    obj.layout16:setHeight(35);
    obj.layout16:setName("layout16");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout16);
    obj.button1:setAlign("left");
    obj.button1:setMargins({left=20});
    obj.button1:setHeight(25);
    obj.button1:setText("Novo Feitiço");
    obj.button1:setWidth(100);
    obj.button1:setName("button1");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.layout16);
    obj.button2:setAlign("left");
    obj.button2:setHeight(25);
    obj.button2:setText("Ordenar");
    obj.button2:setWidth(100);
    obj.button2:setMargins({left=20});
    obj.button2:setName("button2");

    obj.button3 = GUI.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.layout16);
    obj.button3:setAlign("left");
    obj.button3:setHeight(25);
    obj.button3:setText("Teste");
    obj.button3:setWidth(100);
    obj.button3:setMargins({left=20});
    obj.button3:setName("button3");

    obj.layout17 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout17:setParent(obj.aqui);
    obj.layout17:setLeft(20);
    obj.layout17:setTop(60);
    obj.layout17:setHeight(310);
    obj.layout17:setWidth(1200);
    obj.layout17:setName("layout17");

    obj.rectangle13 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle13:setParent(obj.layout17);
    obj.rectangle13:setColor("#444444");
    obj.rectangle13:setWidth(200);
    obj.rectangle13:setAlign("left");
    obj.rectangle13:setStrokeColor("#333333");
    obj.rectangle13:setStrokeSize(2);
    obj.rectangle13:setName("rectangle13");

    obj.rclFeiticos = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclFeiticos:setParent(obj.rectangle13);
    obj.rclFeiticos:setName("rclFeiticos");
    obj.rclFeiticos:setField("magias");
    obj.rclFeiticos:setItemHeight(45);
    obj.rclFeiticos:setTemplateForm("feiticos");
    obj.rclFeiticos:setAlign("left");
    obj.rclFeiticos:setWidth(200);
    obj.rclFeiticos:setVisible(true);
    obj.rclFeiticos:setAutoHeight(false);
    obj.rclFeiticos:setSelectable(true);

    obj.boxDetalhesDoItem = GUI.fromHandle(_obj_newObject("dataScopeBox"));
    obj.boxDetalhesDoItem:setParent(obj.layout17);
    obj.boxDetalhesDoItem:setName("boxDetalhesDoItem");
    obj.boxDetalhesDoItem:setVisible(false);
    obj.boxDetalhesDoItem:setAlign("left");
    obj.boxDetalhesDoItem:setWidth(1000);
    obj.boxDetalhesDoItem:setMargins({left=4, right=4});

    obj.rectangle = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle:setParent(obj.boxDetalhesDoItem);
    obj.rectangle:setName("rectangle");
    obj.rectangle:setColor("darkGrey");
    obj.rectangle:setOpacity(0.35);
    obj.rectangle:setWidth(1020);
    obj.rectangle:setHeight(170);

    obj.layout18 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout18:setParent(obj.boxDetalhesDoItem);
    obj.layout18:setAlign("top");
    obj.layout18:setHeight(170);
    obj.layout18:setName("layout18");

    obj.layout19 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout19:setParent(obj.layout18);
    obj.layout19:setAlign("left");
    obj.layout19:setMargins({left=10});
    obj.layout19:setWidth(180);
    obj.layout19:setName("layout19");

    obj.rectangle14 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle14:setParent(obj.layout19);
    obj.rectangle14:setAlign("top");
    obj.rectangle14:setColor("DarkSlateBlue");
    obj.rectangle14:setMargins({left=60,right=60,top=5});
    obj.rectangle14:setHeight(20);
    obj.rectangle14:setName("rectangle14");

    obj.label15 = GUI.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.rectangle14);
    obj.label15:setAlign("client");
    obj.label15:setText("Nome");
    obj.label15:setHorzTextAlign("center");
    obj.label15:setName("label15");

    obj.nome = GUI.fromHandle(_obj_newObject("edit"));
    obj.nome:setParent(obj.layout19);
    obj.nome:setName("nome");
    lfm_setPropAsString(obj.nome, "fontStyle", "bold italic");
    obj.nome:setFontSize(15);
    obj.nome:setHorzTextAlign("center");
    obj.nome:setHeight(27);
    obj.nome:setAlign("top");
    obj.nome:setField("nome");
    obj.nome:setHitTest(true);

    obj.rectangle15 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle15:setParent(obj.layout19);
    obj.rectangle15:setAlign("top");
    obj.rectangle15:setColor("DarkSlateBlue");
    obj.rectangle15:setMargins({left=60,right=60,top=5});
    obj.rectangle15:setHeight(20);
    obj.rectangle15:setName("rectangle15");

    obj.label16 = GUI.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.rectangle15);
    obj.label16:setAlign("client");
    obj.label16:setText("Escola");
    obj.label16:setHorzTextAlign("center");
    obj.label16:setName("label16");

    obj.escola = GUI.fromHandle(_obj_newObject("edit"));
    obj.escola:setParent(obj.layout19);
    obj.escola:setName("escola");
    obj.escola:setHorzTextAlign("center");
    obj.escola:setHeight(27);
    lfm_setPropAsString(obj.escola, "fontStyle", "bold italic");
    obj.escola:setAlign("top");
    obj.escola:setReadOnly(true);
    obj.escola:setField("escola");

    obj.rectangle16 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle16:setParent(obj.layout19);
    obj.rectangle16:setAlign("top");
    obj.rectangle16:setColor("DarkSlateBlue");
    obj.rectangle16:setMargins({left=60,right=60,top=5});
    obj.rectangle16:setHeight(20);
    obj.rectangle16:setName("rectangle16");

    obj.label17 = GUI.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.rectangle16);
    obj.label17:setAlign("client");
    obj.label17:setText("Ação");
    obj.label17:setHorzTextAlign("center");
    obj.label17:setName("label17");

    obj.tipo = GUI.fromHandle(_obj_newObject("edit"));
    obj.tipo:setParent(obj.layout19);
    obj.tipo:setName("tipo");
    obj.tipo:setHorzTextAlign("center");
    obj.tipo:setHeight(27);
    lfm_setPropAsString(obj.tipo, "fontStyle", "bold italic");
    obj.tipo:setAlign("top");
    obj.tipo:setReadOnly(true);
    obj.tipo:setField("tipo");

    obj.layout20 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout20:setParent(obj.layout18);
    obj.layout20:setAlign("left");
    obj.layout20:setWidth(530);
    obj.layout20:setName("layout20");

    obj.layout21 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout21:setParent(obj.layout20);
    obj.layout21:setAlign("top");
    obj.layout21:setHeight(55);
    obj.layout21:setName("layout21");

    obj.layout22 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout22:setParent(obj.layout21);
    obj.layout22:setAlign("left");
    obj.layout22:setMargins({left=10});
    obj.layout22:setWidth(160);
    obj.layout22:setName("layout22");

    obj.rectangle17 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle17:setParent(obj.layout22);
    obj.rectangle17:setTop(7);
    obj.rectangle17:setLeft(27);
    obj.rectangle17:setColor("DarkSlateBlue");
    obj.rectangle17:setWidth(105);
    obj.rectangle17:setHeight(20);
    obj.rectangle17:setName("rectangle17");

    obj.label18 = GUI.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj.rectangle17);
    obj.label18:setAlign("client");
    obj.label18:setText("Grad");
    obj.label18:setHorzTextAlign("center");
    obj.label18:setName("label18");

    obj.layout23 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout23:setParent(obj.layout22);
    obj.layout23:setTop(27);
    obj.layout23:setWidth(160);
    obj.layout23:setHeight(25);
    obj.layout23:setName("layout23");

    obj.edit13 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.layout23);
    obj.edit13:setTop(0);
    obj.edit13:setWidth(160);
    obj.edit13:setHeight(25);
    obj.edit13:setField("Grad .. _name");
    obj.edit13:setHorzTextAlign("center");
    obj.edit13:setName("edit13");

    obj.edit14 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.layout23);
    obj.edit14:setTop(0);
    obj.edit14:setWidth(160);
    obj.edit14:setHeight(25);
    obj.edit14:setField("Grad .. _array");
    obj.edit14:setHorzTextAlign("center");
    obj.edit14:setName("edit14");

    obj.edit15 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.layout23);
    obj.edit15:setTop(0);
    obj.edit15:setWidth(160);
    obj.edit15:setHeight(25);
    obj.edit15:setField("Grad .. _grad");
    obj.edit15:setHorzTextAlign("center");
    obj.edit15:setName("edit15");

    obj.Grad = GUI.fromHandle(_obj_newObject("edit"));
    obj.Grad:setParent(obj.layout23);
    obj.Grad:setName("Grad");
    obj.Grad:setTop(0);
    obj.Grad:setWidth(160);
    obj.Grad:setHeight(25);
    obj.Grad:setField("Grad");
    obj.Grad:setHorzTextAlign("center");
    obj.Grad:setHitTest(true);
    obj.Grad:setHint("");

    obj.button4 = GUI.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj.layout23);
    obj.button4:setText("-");
    obj.button4:setAlign("left");
    obj.button4:setWidth(20);
    obj.button4:setName("button4");

    obj.button5 = GUI.fromHandle(_obj_newObject("button"));
    obj.button5:setParent(obj.layout23);
    obj.button5:setText("+");
    obj.button5:setAlign("right");
    obj.button5:setWidth(20);
    obj.button5:setName("button5");

    obj.layout24 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout24:setParent(obj.layout21);
    obj.layout24:setAlign("left");
    obj.layout24:setMargins({left=10});
    obj.layout24:setWidth(160);
    obj.layout24:setName("layout24");

    obj.rectangle18 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle18:setParent(obj.layout24);
    obj.rectangle18:setTop(7);
    obj.rectangle18:setLeft(27);
    obj.rectangle18:setColor("DarkSlateBlue");
    obj.rectangle18:setWidth(105);
    obj.rectangle18:setHeight(20);
    obj.rectangle18:setName("rectangle18");

    obj.label19 = GUI.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj.rectangle18);
    obj.label19:setAlign("client");
    obj.label19:setText("CD");
    obj.label19:setHorzTextAlign("center");
    obj.label19:setName("label19");

    obj.layout25 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout25:setParent(obj.layout24);
    obj.layout25:setTop(27);
    obj.layout25:setWidth(160);
    obj.layout25:setHeight(25);
    obj.layout25:setName("layout25");

    obj.edit16 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.layout25);
    obj.edit16:setTop(0);
    obj.edit16:setWidth(160);
    obj.edit16:setHeight(25);
    obj.edit16:setField("CD .. _name");
    obj.edit16:setHorzTextAlign("center");
    obj.edit16:setName("edit16");

    obj.edit17 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit17:setParent(obj.layout25);
    obj.edit17:setTop(0);
    obj.edit17:setWidth(160);
    obj.edit17:setHeight(25);
    obj.edit17:setField("CD .. _array");
    obj.edit17:setHorzTextAlign("center");
    obj.edit17:setName("edit17");

    obj.edit18 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit18:setParent(obj.layout25);
    obj.edit18:setTop(0);
    obj.edit18:setWidth(160);
    obj.edit18:setHeight(25);
    obj.edit18:setField("CD .. _grad");
    obj.edit18:setHorzTextAlign("center");
    obj.edit18:setName("edit18");

    obj.CD = GUI.fromHandle(_obj_newObject("edit"));
    obj.CD:setParent(obj.layout25);
    obj.CD:setName("CD");
    obj.CD:setTop(0);
    obj.CD:setWidth(160);
    obj.CD:setHeight(25);
    obj.CD:setField("CD");
    obj.CD:setHorzTextAlign("center");
    obj.CD:setHitTest(true);
    obj.CD:setHint("");

    obj.button6 = GUI.fromHandle(_obj_newObject("button"));
    obj.button6:setParent(obj.layout25);
    obj.button6:setText("-");
    obj.button6:setAlign("left");
    obj.button6:setWidth(20);
    obj.button6:setName("button6");

    obj.button7 = GUI.fromHandle(_obj_newObject("button"));
    obj.button7:setParent(obj.layout25);
    obj.button7:setText("+");
    obj.button7:setAlign("right");
    obj.button7:setWidth(20);
    obj.button7:setName("button7");

    obj.layout26 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout26:setParent(obj.layout21);
    obj.layout26:setAlign("left");
    obj.layout26:setMargins({left=10});
    obj.layout26:setWidth(160);
    obj.layout26:setName("layout26");

    obj.rectangle19 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle19:setParent(obj.layout26);
    obj.rectangle19:setTop(7);
    obj.rectangle19:setLeft(27);
    obj.rectangle19:setColor("DarkSlateBlue");
    obj.rectangle19:setWidth(105);
    obj.rectangle19:setHeight(20);
    obj.rectangle19:setName("rectangle19");

    obj.label20 = GUI.fromHandle(_obj_newObject("label"));
    obj.label20:setParent(obj.rectangle19);
    obj.label20:setAlign("client");
    obj.label20:setText("Efeito");
    obj.label20:setHorzTextAlign("center");
    obj.label20:setName("label20");

    obj.layout27 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout27:setParent(obj.layout26);
    obj.layout27:setTop(27);
    obj.layout27:setWidth(160);
    obj.layout27:setHeight(25);
    obj.layout27:setName("layout27");

    obj.edit19 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit19:setParent(obj.layout27);
    obj.edit19:setTop(0);
    obj.edit19:setWidth(160);
    obj.edit19:setHeight(25);
    obj.edit19:setField("Efeito .. _name");
    obj.edit19:setHorzTextAlign("center");
    obj.edit19:setName("edit19");

    obj.edit20 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit20:setParent(obj.layout27);
    obj.edit20:setTop(0);
    obj.edit20:setWidth(160);
    obj.edit20:setHeight(25);
    obj.edit20:setField("Efeito .. _array");
    obj.edit20:setHorzTextAlign("center");
    obj.edit20:setName("edit20");

    obj.edit21 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit21:setParent(obj.layout27);
    obj.edit21:setTop(0);
    obj.edit21:setWidth(160);
    obj.edit21:setHeight(25);
    obj.edit21:setField("Efeito .. _grad");
    obj.edit21:setHorzTextAlign("center");
    obj.edit21:setName("edit21");

    obj.Efeito = GUI.fromHandle(_obj_newObject("edit"));
    obj.Efeito:setParent(obj.layout27);
    obj.Efeito:setName("Efeito");
    obj.Efeito:setTop(0);
    obj.Efeito:setWidth(160);
    obj.Efeito:setHeight(25);
    obj.Efeito:setField("Efeito");
    obj.Efeito:setHorzTextAlign("center");
    obj.Efeito:setHitTest(true);
    obj.Efeito:setHint("");

    obj.button8 = GUI.fromHandle(_obj_newObject("button"));
    obj.button8:setParent(obj.layout27);
    obj.button8:setText("-");
    obj.button8:setAlign("left");
    obj.button8:setWidth(20);
    obj.button8:setName("button8");

    obj.button9 = GUI.fromHandle(_obj_newObject("button"));
    obj.button9:setParent(obj.layout27);
    obj.button9:setText("+");
    obj.button9:setAlign("right");
    obj.button9:setWidth(20);
    obj.button9:setName("button9");

    obj.layout28 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout28:setParent(obj.layout20);
    obj.layout28:setAlign("top");
    obj.layout28:setHeight(55);
    obj.layout28:setName("layout28");

    obj.layout29 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout29:setParent(obj.layout28);
    obj.layout29:setAlign("left");
    obj.layout29:setMargins({left=10});
    obj.layout29:setWidth(160);
    obj.layout29:setName("layout29");

    obj.rectangle20 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle20:setParent(obj.layout29);
    obj.rectangle20:setTop(7);
    obj.rectangle20:setLeft(27);
    obj.rectangle20:setColor("DarkSlateBlue");
    obj.rectangle20:setWidth(105);
    obj.rectangle20:setHeight(20);
    obj.rectangle20:setName("rectangle20");

    obj.label21 = GUI.fromHandle(_obj_newObject("label"));
    obj.label21:setParent(obj.rectangle20);
    obj.label21:setAlign("client");
    obj.label21:setText("Poder");
    obj.label21:setHorzTextAlign("center");
    obj.label21:setName("label21");

    obj.layout30 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout30:setParent(obj.layout29);
    obj.layout30:setTop(27);
    obj.layout30:setWidth(160);
    obj.layout30:setHeight(25);
    obj.layout30:setName("layout30");

    obj.edit22 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit22:setParent(obj.layout30);
    obj.edit22:setTop(0);
    obj.edit22:setWidth(160);
    obj.edit22:setHeight(25);
    obj.edit22:setField("Poder .. _name");
    obj.edit22:setHorzTextAlign("center");
    obj.edit22:setName("edit22");

    obj.edit23 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit23:setParent(obj.layout30);
    obj.edit23:setTop(0);
    obj.edit23:setWidth(160);
    obj.edit23:setHeight(25);
    obj.edit23:setField("Poder .. _array");
    obj.edit23:setHorzTextAlign("center");
    obj.edit23:setName("edit23");

    obj.edit24 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit24:setParent(obj.layout30);
    obj.edit24:setTop(0);
    obj.edit24:setWidth(160);
    obj.edit24:setHeight(25);
    obj.edit24:setField("Poder .. _grad");
    obj.edit24:setHorzTextAlign("center");
    obj.edit24:setName("edit24");

    obj.Poder = GUI.fromHandle(_obj_newObject("edit"));
    obj.Poder:setParent(obj.layout30);
    obj.Poder:setName("Poder");
    obj.Poder:setTop(0);
    obj.Poder:setWidth(160);
    obj.Poder:setHeight(25);
    obj.Poder:setField("Poder");
    obj.Poder:setHorzTextAlign("center");
    obj.Poder:setHitTest(true);
    obj.Poder:setHint("");

    obj.button10 = GUI.fromHandle(_obj_newObject("button"));
    obj.button10:setParent(obj.layout30);
    obj.button10:setText("-");
    obj.button10:setAlign("left");
    obj.button10:setWidth(20);
    obj.button10:setName("button10");

    obj.button11 = GUI.fromHandle(_obj_newObject("button"));
    obj.button11:setParent(obj.layout30);
    obj.button11:setText("+");
    obj.button11:setAlign("right");
    obj.button11:setWidth(20);
    obj.button11:setName("button11");

    obj.layout31 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout31:setParent(obj.layout28);
    obj.layout31:setAlign("left");
    obj.layout31:setMargins({left=10});
    obj.layout31:setWidth(160);
    obj.layout31:setName("layout31");

    obj.rectangle21 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle21:setParent(obj.layout31);
    obj.rectangle21:setTop(7);
    obj.rectangle21:setLeft(27);
    obj.rectangle21:setColor("DarkSlateBlue");
    obj.rectangle21:setWidth(105);
    obj.rectangle21:setHeight(20);
    obj.rectangle21:setName("rectangle21");

    obj.label22 = GUI.fromHandle(_obj_newObject("label"));
    obj.label22:setParent(obj.rectangle21);
    obj.label22:setAlign("client");
    obj.label22:setText("Dano");
    obj.label22:setHorzTextAlign("center");
    obj.label22:setName("label22");

    obj.layout32 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout32:setParent(obj.layout31);
    obj.layout32:setTop(27);
    obj.layout32:setWidth(160);
    obj.layout32:setHeight(25);
    obj.layout32:setName("layout32");

    obj.edit25 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit25:setParent(obj.layout32);
    obj.edit25:setTop(0);
    obj.edit25:setWidth(160);
    obj.edit25:setHeight(25);
    obj.edit25:setField("Dano .. _name");
    obj.edit25:setHorzTextAlign("center");
    obj.edit25:setName("edit25");

    obj.edit26 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit26:setParent(obj.layout32);
    obj.edit26:setTop(0);
    obj.edit26:setWidth(160);
    obj.edit26:setHeight(25);
    obj.edit26:setField("Dano .. _array");
    obj.edit26:setHorzTextAlign("center");
    obj.edit26:setName("edit26");

    obj.edit27 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit27:setParent(obj.layout32);
    obj.edit27:setTop(0);
    obj.edit27:setWidth(160);
    obj.edit27:setHeight(25);
    obj.edit27:setField("Dano .. _grad");
    obj.edit27:setHorzTextAlign("center");
    obj.edit27:setName("edit27");

    obj.Dano = GUI.fromHandle(_obj_newObject("edit"));
    obj.Dano:setParent(obj.layout32);
    obj.Dano:setName("Dano");
    obj.Dano:setTop(0);
    obj.Dano:setWidth(160);
    obj.Dano:setHeight(25);
    obj.Dano:setField("Dano");
    obj.Dano:setHorzTextAlign("center");
    obj.Dano:setHitTest(true);
    obj.Dano:setHint("");

    obj.button12 = GUI.fromHandle(_obj_newObject("button"));
    obj.button12:setParent(obj.layout32);
    obj.button12:setText("-");
    obj.button12:setAlign("left");
    obj.button12:setWidth(20);
    obj.button12:setName("button12");

    obj.button13 = GUI.fromHandle(_obj_newObject("button"));
    obj.button13:setParent(obj.layout32);
    obj.button13:setText("+");
    obj.button13:setAlign("right");
    obj.button13:setWidth(20);
    obj.button13:setName("button13");

    obj.layout33 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout33:setParent(obj.layout28);
    obj.layout33:setAlign("left");
    obj.layout33:setMargins({left=10});
    obj.layout33:setWidth(160);
    obj.layout33:setName("layout33");

    obj.rectangle22 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle22:setParent(obj.layout33);
    obj.rectangle22:setTop(7);
    obj.rectangle22:setLeft(27);
    obj.rectangle22:setColor("DarkSlateBlue");
    obj.rectangle22:setWidth(105);
    obj.rectangle22:setHeight(20);
    obj.rectangle22:setName("rectangle22");

    obj.label23 = GUI.fromHandle(_obj_newObject("label"));
    obj.label23:setParent(obj.rectangle22);
    obj.label23:setAlign("client");
    obj.label23:setText("Bonus");
    obj.label23:setHorzTextAlign("center");
    obj.label23:setName("label23");

    obj.layout34 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout34:setParent(obj.layout33);
    obj.layout34:setTop(27);
    obj.layout34:setWidth(160);
    obj.layout34:setHeight(25);
    obj.layout34:setName("layout34");

    obj.edit28 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit28:setParent(obj.layout34);
    obj.edit28:setTop(0);
    obj.edit28:setWidth(160);
    obj.edit28:setHeight(25);
    obj.edit28:setField("Bonus .. _name");
    obj.edit28:setHorzTextAlign("center");
    obj.edit28:setName("edit28");

    obj.edit29 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit29:setParent(obj.layout34);
    obj.edit29:setTop(0);
    obj.edit29:setWidth(160);
    obj.edit29:setHeight(25);
    obj.edit29:setField("Bonus .. _array");
    obj.edit29:setHorzTextAlign("center");
    obj.edit29:setName("edit29");

    obj.edit30 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit30:setParent(obj.layout34);
    obj.edit30:setTop(0);
    obj.edit30:setWidth(160);
    obj.edit30:setHeight(25);
    obj.edit30:setField("Bonus .. _grad");
    obj.edit30:setHorzTextAlign("center");
    obj.edit30:setName("edit30");

    obj.Bonus = GUI.fromHandle(_obj_newObject("edit"));
    obj.Bonus:setParent(obj.layout34);
    obj.Bonus:setName("Bonus");
    obj.Bonus:setTop(0);
    obj.Bonus:setWidth(160);
    obj.Bonus:setHeight(25);
    obj.Bonus:setField("Bonus");
    obj.Bonus:setHorzTextAlign("center");
    obj.Bonus:setHitTest(true);
    obj.Bonus:setHint("");

    obj.button14 = GUI.fromHandle(_obj_newObject("button"));
    obj.button14:setParent(obj.layout34);
    obj.button14:setText("-");
    obj.button14:setAlign("left");
    obj.button14:setWidth(20);
    obj.button14:setName("button14");

    obj.button15 = GUI.fromHandle(_obj_newObject("button"));
    obj.button15:setParent(obj.layout34);
    obj.button15:setText("+");
    obj.button15:setAlign("right");
    obj.button15:setWidth(20);
    obj.button15:setName("button15");

    obj.layout35 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout35:setParent(obj.layout20);
    obj.layout35:setAlign("top");
    obj.layout35:setHeight(55);
    obj.layout35:setName("layout35");

    obj.layout36 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout36:setParent(obj.layout35);
    obj.layout36:setAlign("left");
    obj.layout36:setMargins({left=10});
    obj.layout36:setWidth(160);
    obj.layout36:setName("layout36");

    obj.rectangle23 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle23:setParent(obj.layout36);
    obj.rectangle23:setTop(7);
    obj.rectangle23:setLeft(27);
    obj.rectangle23:setColor("DarkSlateBlue");
    obj.rectangle23:setWidth(105);
    obj.rectangle23:setHeight(20);
    obj.rectangle23:setName("rectangle23");

    obj.label24 = GUI.fromHandle(_obj_newObject("label"));
    obj.label24:setParent(obj.rectangle23);
    obj.label24:setAlign("client");
    obj.label24:setText("Range");
    obj.label24:setHorzTextAlign("center");
    obj.label24:setName("label24");

    obj.layout37 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout37:setParent(obj.layout36);
    obj.layout37:setTop(27);
    obj.layout37:setWidth(160);
    obj.layout37:setHeight(25);
    obj.layout37:setName("layout37");

    obj.edit31 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit31:setParent(obj.layout37);
    obj.edit31:setTop(0);
    obj.edit31:setWidth(160);
    obj.edit31:setHeight(25);
    obj.edit31:setField("Range .. _name");
    obj.edit31:setHorzTextAlign("center");
    obj.edit31:setName("edit31");

    obj.edit32 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit32:setParent(obj.layout37);
    obj.edit32:setTop(0);
    obj.edit32:setWidth(160);
    obj.edit32:setHeight(25);
    obj.edit32:setField("Range .. _array");
    obj.edit32:setHorzTextAlign("center");
    obj.edit32:setName("edit32");

    obj.edit33 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit33:setParent(obj.layout37);
    obj.edit33:setTop(0);
    obj.edit33:setWidth(160);
    obj.edit33:setHeight(25);
    obj.edit33:setField("Range .. _grad");
    obj.edit33:setHorzTextAlign("center");
    obj.edit33:setName("edit33");

    obj.Range = GUI.fromHandle(_obj_newObject("edit"));
    obj.Range:setParent(obj.layout37);
    obj.Range:setName("Range");
    obj.Range:setTop(0);
    obj.Range:setWidth(160);
    obj.Range:setHeight(25);
    obj.Range:setField("Range");
    obj.Range:setHorzTextAlign("center");
    obj.Range:setHitTest(true);
    obj.Range:setHint("");

    obj.button16 = GUI.fromHandle(_obj_newObject("button"));
    obj.button16:setParent(obj.layout37);
    obj.button16:setText("-");
    obj.button16:setAlign("left");
    obj.button16:setWidth(20);
    obj.button16:setName("button16");

    obj.button17 = GUI.fromHandle(_obj_newObject("button"));
    obj.button17:setParent(obj.layout37);
    obj.button17:setText("+");
    obj.button17:setAlign("right");
    obj.button17:setWidth(20);
    obj.button17:setName("button17");

    obj.layout38 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout38:setParent(obj.layout35);
    obj.layout38:setAlign("left");
    obj.layout38:setMargins({left=10});
    obj.layout38:setWidth(160);
    obj.layout38:setName("layout38");

    obj.rectangle24 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle24:setParent(obj.layout38);
    obj.rectangle24:setTop(7);
    obj.rectangle24:setLeft(27);
    obj.rectangle24:setColor("DarkSlateBlue");
    obj.rectangle24:setWidth(105);
    obj.rectangle24:setHeight(20);
    obj.rectangle24:setName("rectangle24");

    obj.label25 = GUI.fromHandle(_obj_newObject("label"));
    obj.label25:setParent(obj.rectangle24);
    obj.label25:setAlign("client");
    obj.label25:setText("Area");
    obj.label25:setHorzTextAlign("center");
    obj.label25:setName("label25");

    obj.layout39 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout39:setParent(obj.layout38);
    obj.layout39:setTop(27);
    obj.layout39:setWidth(160);
    obj.layout39:setHeight(25);
    obj.layout39:setName("layout39");

    obj.edit34 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit34:setParent(obj.layout39);
    obj.edit34:setTop(0);
    obj.edit34:setWidth(160);
    obj.edit34:setHeight(25);
    obj.edit34:setField("Area .. _name");
    obj.edit34:setHorzTextAlign("center");
    obj.edit34:setName("edit34");

    obj.edit35 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit35:setParent(obj.layout39);
    obj.edit35:setTop(0);
    obj.edit35:setWidth(160);
    obj.edit35:setHeight(25);
    obj.edit35:setField("Area .. _array");
    obj.edit35:setHorzTextAlign("center");
    obj.edit35:setName("edit35");

    obj.edit36 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit36:setParent(obj.layout39);
    obj.edit36:setTop(0);
    obj.edit36:setWidth(160);
    obj.edit36:setHeight(25);
    obj.edit36:setField("Area .. _grad");
    obj.edit36:setHorzTextAlign("center");
    obj.edit36:setName("edit36");

    obj.Area = GUI.fromHandle(_obj_newObject("edit"));
    obj.Area:setParent(obj.layout39);
    obj.Area:setName("Area");
    obj.Area:setTop(0);
    obj.Area:setWidth(160);
    obj.Area:setHeight(25);
    obj.Area:setField("Area");
    obj.Area:setHorzTextAlign("center");
    obj.Area:setHitTest(true);
    obj.Area:setHint("");

    obj.button18 = GUI.fromHandle(_obj_newObject("button"));
    obj.button18:setParent(obj.layout39);
    obj.button18:setText("-");
    obj.button18:setAlign("left");
    obj.button18:setWidth(20);
    obj.button18:setName("button18");

    obj.button19 = GUI.fromHandle(_obj_newObject("button"));
    obj.button19:setParent(obj.layout39);
    obj.button19:setText("+");
    obj.button19:setAlign("right");
    obj.button19:setWidth(20);
    obj.button19:setName("button19");

    obj.layout40 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout40:setParent(obj.layout35);
    obj.layout40:setAlign("left");
    obj.layout40:setMargins({left=10});
    obj.layout40:setWidth(160);
    obj.layout40:setName("layout40");

    obj.rectangle25 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle25:setParent(obj.layout40);
    obj.rectangle25:setTop(7);
    obj.rectangle25:setLeft(27);
    obj.rectangle25:setColor("DarkSlateBlue");
    obj.rectangle25:setWidth(105);
    obj.rectangle25:setHeight(20);
    obj.rectangle25:setName("rectangle25");

    obj.label26 = GUI.fromHandle(_obj_newObject("label"));
    obj.label26:setParent(obj.rectangle25);
    obj.label26:setAlign("client");
    obj.label26:setText("Duração");
    obj.label26:setHorzTextAlign("center");
    obj.label26:setName("label26");

    obj.layout41 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout41:setParent(obj.layout40);
    obj.layout41:setTop(27);
    obj.layout41:setWidth(160);
    obj.layout41:setHeight(25);
    obj.layout41:setName("layout41");

    obj.edit37 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit37:setParent(obj.layout41);
    obj.edit37:setTop(0);
    obj.edit37:setWidth(160);
    obj.edit37:setHeight(25);
    obj.edit37:setField("Duracao .. _name");
    obj.edit37:setHorzTextAlign("center");
    obj.edit37:setName("edit37");

    obj.edit38 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit38:setParent(obj.layout41);
    obj.edit38:setTop(0);
    obj.edit38:setWidth(160);
    obj.edit38:setHeight(25);
    obj.edit38:setField("Duracao .. _array");
    obj.edit38:setHorzTextAlign("center");
    obj.edit38:setName("edit38");

    obj.edit39 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit39:setParent(obj.layout41);
    obj.edit39:setTop(0);
    obj.edit39:setWidth(160);
    obj.edit39:setHeight(25);
    obj.edit39:setField("Duracao .. _grad");
    obj.edit39:setHorzTextAlign("center");
    obj.edit39:setName("edit39");

    obj.Duracao = GUI.fromHandle(_obj_newObject("edit"));
    obj.Duracao:setParent(obj.layout41);
    obj.Duracao:setName("Duracao");
    obj.Duracao:setTop(0);
    obj.Duracao:setWidth(160);
    obj.Duracao:setHeight(25);
    obj.Duracao:setField("Duracao");
    obj.Duracao:setHorzTextAlign("center");
    obj.Duracao:setHitTest(true);
    obj.Duracao:setHint("");

    obj.button20 = GUI.fromHandle(_obj_newObject("button"));
    obj.button20:setParent(obj.layout41);
    obj.button20:setText("-");
    obj.button20:setAlign("left");
    obj.button20:setWidth(20);
    obj.button20:setName("button20");

    obj.button21 = GUI.fromHandle(_obj_newObject("button"));
    obj.button21:setParent(obj.layout41);
    obj.button21:setText("+");
    obj.button21:setAlign("right");
    obj.button21:setWidth(20);
    obj.button21:setName("button21");

    obj.layout42 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout42:setParent(obj.layout18);
    obj.layout42:setWidth(50);
    obj.layout42:setAlign("left");
    obj.layout42:setName("layout42");

    obj.rectangle26 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle26:setParent(obj.layout42);
    obj.rectangle26:setTop(55);
    obj.rectangle26:setLeft(5);
    obj.rectangle26:setColor("purple");
    obj.rectangle26:setWidth(40);
    obj.rectangle26:setHeight(20);
    obj.rectangle26:setName("rectangle26");

    obj.label27 = GUI.fromHandle(_obj_newObject("label"));
    obj.label27:setParent(obj.rectangle26);
    obj.label27:setAlign("client");
    obj.label27:setText("Order");
    obj.label27:setHorzTextAlign("center");
    obj.label27:setName("label27");

    obj.edit40 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit40:setParent(obj.layout42);
    obj.edit40:setTop(75);
    obj.edit40:setLeft(5);
    obj.edit40:setWidth(40);
    obj.edit40:setHeight(25);
    obj.edit40:setField("Order");
    obj.edit40:setHorzTextAlign("center");
    obj.edit40:setHint("Quanto menor mais acima na lista!");
    obj.edit40:setName("edit40");

    obj.layout43 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout43:setParent(obj.layout18);
    obj.layout43:setWidth(100);
    obj.layout43:setAlign("left");
    obj.layout43:setName("layout43");

    obj.button22 = GUI.fromHandle(_obj_newObject("button"));
    obj.button22:setParent(obj.layout43);
    obj.button22:setAlign("top");
    obj.button22:setText("Rolar");
    obj.button22:setHeight(35);
    obj.button22:setMargins({bottom=5});
    obj.button22:setName("button22");

    obj.button23 = GUI.fromHandle(_obj_newObject("button"));
    obj.button23:setParent(obj.layout43);
    obj.button23:setAlign("top");
    obj.button23:setText("Importar");
    obj.button23:setHeight(35);
    obj.button23:setMargins({bottom=5});
    obj.button23:setName("button23");

    obj.button24 = GUI.fromHandle(_obj_newObject("button"));
    obj.button24:setParent(obj.layout43);
    obj.button24:setAlign("top");
    obj.button24:setText("Apagar");
    obj.button24:setHeight(35);
    obj.button24:setMargins({bottom=5});
    obj.button24:setName("button24");

    obj.button25 = GUI.fromHandle(_obj_newObject("button"));
    obj.button25:setParent(obj.layout43);
    obj.button25:setAlign("top");
    obj.button25:setText("Comparar");
    obj.button25:setHeight(35);
    obj.button25:setName("button25");

    obj.popUp = GUI.fromHandle(_obj_newObject("popup"));
    obj.popUp:setParent(obj.scrollBox1);
    obj.popUp:setName("popUp");
    obj.popUp:setLeft(50);
    obj.popUp:setTop(50);
    obj.popUp:setWidth(600);
    obj.popUp:setHeight(420);
    obj.popUp:setBackOpacity(0.5);

    obj.layout44 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout44:setParent(obj.popUp);
    obj.layout44:setAlign("left");
    obj.layout44:setWidth(200);
    obj.layout44:setName("layout44");

    obj.layout45 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout45:setParent(obj.layout44);
    obj.layout45:setAlign("top");
    obj.layout45:setHeight(30);
    obj.layout45:setName("layout45");

    obj.label28 = GUI.fromHandle(_obj_newObject("label"));
    obj.label28:setParent(obj.layout45);
    obj.label28:setAlign("left");
    obj.label28:setWidth(100);
    obj.label28:setText("");
    obj.label28:setHorzTextAlign("center");
    obj.label28:setName("label28");

    obj.label29 = GUI.fromHandle(_obj_newObject("label"));
    obj.label29:setParent(obj.layout45);
    obj.label29:setAlign("left");
    obj.label29:setWidth(100);
    obj.label29:setText("Original");
    obj.label29:setHorzTextAlign("center");
    obj.label29:setName("label29");

    obj.layout46 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout46:setParent(obj.layout44);
    obj.layout46:setAlign("top");
    obj.layout46:setHeight(400);
    obj.layout46:setName("layout46");

    obj.rectangle27 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle27:setParent(obj.layout46);
    obj.rectangle27:setAlign("left");
    obj.rectangle27:setWidth(100);
    obj.rectangle27:setColor("black");
    obj.rectangle27:setName("rectangle27");

    obj.edit41 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit41:setParent(obj.rectangle27);
    obj.edit41:setTransparent(true);
    obj.edit41:setMargins({top=5,bottom=5});
    obj.edit41:setAlign("top");
    obj.edit41:setText("GRAD");
    obj.edit41:setHorzTextAlign("center");
    obj.edit41:setName("edit41");

    obj.edit42 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit42:setParent(obj.rectangle27);
    obj.edit42:setTransparent(true);
    obj.edit42:setMargins({bottom=5});
    obj.edit42:setAlign("top");
    obj.edit42:setText("CD");
    obj.edit42:setHorzTextAlign("center");
    obj.edit42:setName("edit42");

    obj.edit43 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit43:setParent(obj.rectangle27);
    obj.edit43:setTransparent(true);
    obj.edit43:setMargins({bottom=5});
    obj.edit43:setAlign("top");
    obj.edit43:setText("PODER");
    obj.edit43:setHorzTextAlign("center");
    obj.edit43:setName("edit43");

    obj.edit44 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit44:setParent(obj.rectangle27);
    obj.edit44:setTransparent(true);
    obj.edit44:setMargins({bottom=5});
    obj.edit44:setAlign("top");
    obj.edit44:setText("DANO");
    obj.edit44:setHorzTextAlign("center");
    obj.edit44:setName("edit44");

    obj.edit45 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit45:setParent(obj.rectangle27);
    obj.edit45:setTransparent(true);
    obj.edit45:setMargins({bottom=5});
    obj.edit45:setAlign("top");
    obj.edit45:setText("RANGE");
    obj.edit45:setHorzTextAlign("center");
    obj.edit45:setName("edit45");

    obj.edit46 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit46:setParent(obj.rectangle27);
    obj.edit46:setTransparent(true);
    obj.edit46:setMargins({bottom=5});
    obj.edit46:setAlign("top");
    obj.edit46:setText("AREA");
    obj.edit46:setHorzTextAlign("center");
    obj.edit46:setName("edit46");

    obj.edit47 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit47:setParent(obj.rectangle27);
    obj.edit47:setTransparent(true);
    obj.edit47:setMargins({bottom=5});
    obj.edit47:setAlign("top");
    obj.edit47:setText("DURAÇÃO");
    obj.edit47:setHorzTextAlign("center");
    obj.edit47:setName("edit47");

    obj.rectangle28 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle28:setParent(obj.layout46);
    obj.rectangle28:setAlign("left");
    obj.rectangle28:setWidth(100);
    obj.rectangle28:setColor("black");
    obj.rectangle28:setName("rectangle28");

    obj.edit48 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit48:setParent(obj.rectangle28);
    obj.edit48:setMargins({top=5,bottom=5});
    obj.edit48:setAlign("top");
    obj.edit48:setField("Grad2");
    obj.edit48:setHorzTextAlign("center");
    obj.edit48:setName("edit48");

    obj.edit49 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit49:setParent(obj.rectangle28);
    obj.edit49:setMargins({bottom=5});
    obj.edit49:setAlign("top");
    obj.edit49:setField("CD2");
    obj.edit49:setHorzTextAlign("center");
    obj.edit49:setName("edit49");

    obj.edit50 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit50:setParent(obj.rectangle28);
    obj.edit50:setMargins({bottom=5});
    obj.edit50:setAlign("top");
    obj.edit50:setField("Poder2");
    obj.edit50:setHorzTextAlign("center");
    obj.edit50:setName("edit50");

    obj.edit51 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit51:setParent(obj.rectangle28);
    obj.edit51:setMargins({bottom=5});
    obj.edit51:setAlign("top");
    obj.edit51:setField("Dano2");
    obj.edit51:setHorzTextAlign("center");
    obj.edit51:setName("edit51");

    obj.edit52 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit52:setParent(obj.rectangle28);
    obj.edit52:setMargins({bottom=5});
    obj.edit52:setAlign("top");
    obj.edit52:setField("Range2");
    obj.edit52:setHorzTextAlign("center");
    obj.edit52:setName("edit52");

    obj.edit53 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit53:setParent(obj.rectangle28);
    obj.edit53:setMargins({bottom=5});
    obj.edit53:setAlign("top");
    obj.edit53:setField("Area2");
    obj.edit53:setHorzTextAlign("center");
    obj.edit53:setName("edit53");

    obj.edit54 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit54:setParent(obj.rectangle28);
    obj.edit54:setMargins({bottom=5});
    obj.edit54:setAlign("top");
    obj.edit54:setField("Duracao2");
    obj.edit54:setHorzTextAlign("center");
    obj.edit54:setName("edit54");

    obj.layout47 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout47:setParent(obj.popUp);
    obj.layout47:setAlign("left");
    obj.layout47:setWidth(100);
    obj.layout47:setName("layout47");

    obj.label30 = GUI.fromHandle(_obj_newObject("label"));
    obj.label30:setParent(obj.layout47);
    obj.label30:setAlign("top");
    obj.label30:setHeight(30);
    obj.label30:setText("Atual");
    obj.label30:setHorzTextAlign("center");
    obj.label30:setName("label30");

    obj.layout48 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout48:setParent(obj.layout47);
    obj.layout48:setAlign("top");
    obj.layout48:setHeight(360);
    obj.layout48:setName("layout48");

    obj.rectangle29 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle29:setParent(obj.layout48);
    obj.rectangle29:setAlign("left");
    obj.rectangle29:setWidth(100);
    obj.rectangle29:setColor("black");
    obj.rectangle29:setName("rectangle29");

    obj.edit55 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit55:setParent(obj.rectangle29);
    obj.edit55:setMargins({top=5,bottom=5});
    obj.edit55:setAlign("top");
    obj.edit55:setField("Grad");
    obj.edit55:setHorzTextAlign("center");
    obj.edit55:setName("edit55");

    obj.edit56 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit56:setParent(obj.rectangle29);
    obj.edit56:setMargins({bottom=5});
    obj.edit56:setAlign("top");
    obj.edit56:setField("CD");
    obj.edit56:setHorzTextAlign("center");
    obj.edit56:setName("edit56");

    obj.edit57 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit57:setParent(obj.rectangle29);
    obj.edit57:setMargins({bottom=5});
    obj.edit57:setAlign("top");
    obj.edit57:setField("Poder");
    obj.edit57:setHorzTextAlign("center");
    obj.edit57:setName("edit57");

    obj.edit58 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit58:setParent(obj.rectangle29);
    obj.edit58:setMargins({bottom=5});
    obj.edit58:setAlign("top");
    obj.edit58:setField("Dano");
    obj.edit58:setHorzTextAlign("center");
    obj.edit58:setName("edit58");

    obj.edit59 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit59:setParent(obj.rectangle29);
    obj.edit59:setMargins({bottom=5});
    obj.edit59:setAlign("top");
    obj.edit59:setField("Range");
    obj.edit59:setHorzTextAlign("center");
    obj.edit59:setName("edit59");

    obj.edit60 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit60:setParent(obj.rectangle29);
    obj.edit60:setMargins({bottom=5});
    obj.edit60:setAlign("top");
    obj.edit60:setField("Area");
    obj.edit60:setHorzTextAlign("center");
    obj.edit60:setName("edit60");

    obj.edit61 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit61:setParent(obj.rectangle29);
    obj.edit61:setMargins({bottom=5});
    obj.edit61:setAlign("top");
    obj.edit61:setField("Duracao");
    obj.edit61:setHorzTextAlign("center");
    obj.edit61:setName("edit61");

    obj.layout49 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout49:setParent(obj.popUp);
    obj.layout49:setAlign("left");
    obj.layout49:setWidth(280);
    obj.layout49:setMargins({left=10});
    obj.layout49:setName("layout49");

    obj.label31 = GUI.fromHandle(_obj_newObject("label"));
    obj.label31:setParent(obj.layout49);
    obj.label31:setAlign("top");
    obj.label31:setHeight(30);
    obj.label31:setText("Descrição");
    obj.label31:setHorzTextAlign("center");
    obj.label31:setName("label31");

    obj.label32 = GUI.fromHandle(_obj_newObject("label"));
    obj.label32:setParent(obj.layout49);
    obj.label32:setAlign("top");
    obj.label32:setHeight(70);
    obj.label32:setMargins({top=10});
    obj.label32:setAutoSize(true);
    obj.label32:setField("Desc");
    obj.label32:setHorzTextAlign("center");
    obj.label32:setName("label32");

    obj.label33 = GUI.fromHandle(_obj_newObject("label"));
    obj.label33:setParent(obj.layout49);
    obj.label33:setAlign("top");
    obj.label33:setHeight(50);
    obj.label33:setText("Efeito");
    obj.label33:setHorzTextAlign("center");
    obj.label33:setName("label33");

    obj.label34 = GUI.fromHandle(_obj_newObject("label"));
    obj.label34:setParent(obj.layout49);
    obj.label34:setAlign("top");
    obj.label34:setHeight(70);
    obj.label34:setMargins({top=10});
    obj.label34:setAutoSize(true);
    obj.label34:setField("Efeito");
    obj.label34:setHorzTextAlign("center");
    obj.label34:setName("label34");

    obj.label35 = GUI.fromHandle(_obj_newObject("label"));
    obj.label35:setParent(obj.layout49);
    obj.label35:setAlign("top");
    obj.label35:setHeight(30);
    obj.label35:setText("Bonus");
    obj.label35:setHorzTextAlign("center");
    obj.label35:setName("label35");

    obj.label36 = GUI.fromHandle(_obj_newObject("label"));
    obj.label36:setParent(obj.layout49);
    obj.label36:setAlign("top");
    obj.label36:setHeight(70);
    obj.label36:setMargins({top=10});
    obj.label36:setAutoSize(true);
    obj.label36:setField("Bonus");
    obj.label36:setHorzTextAlign("center");
    obj.label36:setName("label36");

    obj.layout50 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout50:setParent(obj.popUp);
    obj.layout50:setAlign("bottom");
    obj.layout50:setMargins({top=10});
    obj.layout50:setName("layout50");

    obj.button26 = GUI.fromHandle(_obj_newObject("button"));
    obj.button26:setParent(obj.layout50);
    obj.button26:setAlign("top");
    obj.button26:setText("Fechar");
    obj.button26:setName("button26");

    obj.button27 = GUI.fromHandle(_obj_newObject("button"));
    obj.button27:setParent(obj.layout50);
    obj.button27:setAlign("top");
    obj.button27:setText("Enviar na Mesa");
    obj.button27:setName("button27");

    obj.tab2 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab2:setParent(obj.tabControl1);
    obj.tab2:setTitle("Jogador");
    obj.tab2:setName("tab2");

    obj.scrollBox2 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox2:setParent(obj.tab2);
    obj.scrollBox2:setAlign("client");
    obj.scrollBox2:setName("scrollBox2");

    obj.layout51 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout51:setParent(obj.scrollBox2);
    obj.layout51:setName("layout51");

    obj.rectangle30 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle30:setParent(obj.scrollBox2);
    obj.rectangle30:setLeft(20);
    obj.rectangle30:setTop(20);
    obj.rectangle30:setWidth(200);
    obj.rectangle30:setHeight(200);
    obj.rectangle30:setName("rectangle30");

    obj.image2 = GUI.fromHandle(_obj_newObject("image"));
    obj.image2:setParent(obj.scrollBox2);
    obj.image2:setField("imagemDoPersonagem");
    obj.image2:setEditable(true);
    obj.image2:setStyle("autoFit");
    obj.image2:setLeft(20);
    obj.image2:setTop(20);
    obj.image2:setWidth(200);
    obj.image2:setHeight(200);
    obj.image2:setName("image2");

    obj.layout52 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout52:setParent(obj.scrollBox2);
    obj.layout52:setLeft(20);
    obj.layout52:setTop(20);
    obj.layout52:setWidth(1300);
    obj.layout52:setHeight(1000);
    obj.layout52:setName("layout52");

    obj.rectangle31 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle31:setParent(obj.layout52);
    obj.rectangle31:setLeft(220);
    obj.rectangle31:setTop(0);
    obj.rectangle31:setWidth(700);
    obj.rectangle31:setHeight(155);
    obj.rectangle31:setColor("black");
    obj.rectangle31:setName("rectangle31");

    obj.label37 = GUI.fromHandle(_obj_newObject("label"));
    obj.label37:setParent(obj.rectangle31);
    obj.label37:setLeft(5);
    obj.label37:setTop(5);
    obj.label37:setText("Nome Jogador");
    obj.label37:setWidth(90);
    obj.label37:setHeight(25);
    obj.label37:setName("label37");

    obj.label38 = GUI.fromHandle(_obj_newObject("label"));
    obj.label38:setParent(obj.rectangle31);
    obj.label38:setLeft(5);
    obj.label38:setTop(35);
    obj.label38:setText("Nome Personagem");
    obj.label38:setWidth(110);
    obj.label38:setHeight(25);
    obj.label38:setName("label38");

    obj.label39 = GUI.fromHandle(_obj_newObject("label"));
    obj.label39:setParent(obj.rectangle31);
    obj.label39:setLeft(5);
    obj.label39:setTop(65);
    obj.label39:setText("Casa");
    obj.label39:setWidth(90);
    obj.label39:setHeight(25);
    obj.label39:setName("label39");

    obj.label40 = GUI.fromHandle(_obj_newObject("label"));
    obj.label40:setParent(obj.rectangle31);
    obj.label40:setLeft(5);
    obj.label40:setTop(95);
    obj.label40:setText("Continente");
    obj.label40:setWidth(90);
    obj.label40:setHeight(25);
    obj.label40:setName("label40");

    obj.label41 = GUI.fromHandle(_obj_newObject("label"));
    obj.label41:setParent(obj.rectangle31);
    obj.label41:setLeft(5);
    obj.label41:setTop(125);
    obj.label41:setText("Classe");
    obj.label41:setWidth(90);
    obj.label41:setHeight(25);
    obj.label41:setName("label41");

    obj.label42 = GUI.fromHandle(_obj_newObject("label"));
    obj.label42:setParent(obj.rectangle31);
    obj.label42:setLeft(130);
    obj.label42:setTop(125);
    obj.label42:setText("Level");
    obj.label42:setWidth(90);
    obj.label42:setHeight(25);
    obj.label42:setName("label42");

    obj.label43 = GUI.fromHandle(_obj_newObject("label"));
    obj.label43:setParent(obj.rectangle31);
    obj.label43:setLeft(222);
    obj.label43:setTop(125);
    obj.label43:setText("XP");
    obj.label43:setWidth(90);
    obj.label43:setHeight(25);
    obj.label43:setName("label43");

    obj.edit62 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit62:setParent(obj.rectangle31);
    obj.edit62:setLeft(100);
    obj.edit62:setTop(5);
    obj.edit62:setWidth(245);
    obj.edit62:setHeight(25);
    obj.edit62:setName("edit62");

    obj.edit63 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit63:setParent(obj.rectangle31);
    obj.edit63:setLeft(120);
    obj.edit63:setTop(35);
    obj.edit63:setWidth(225);
    obj.edit63:setHeight(25);
    obj.edit63:setName("edit63");

    obj.edit64 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit64:setParent(obj.rectangle31);
    obj.edit64:setLeft(52);
    obj.edit64:setTop(65);
    obj.edit64:setWidth(293);
    obj.edit64:setHeight(25);
    obj.edit64:setName("edit64");

    obj.edit65 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit65:setParent(obj.rectangle31);
    obj.edit65:setLeft(75);
    obj.edit65:setTop(95);
    obj.edit65:setWidth(270);
    obj.edit65:setHeight(25);
    obj.edit65:setName("edit65");

    obj.edit66 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit66:setParent(obj.rectangle31);
    obj.edit66:setLeft(45);
    obj.edit66:setTop(125);
    obj.edit66:setWidth(80);
    obj.edit66:setHeight(25);
    obj.edit66:setName("edit66");

    obj.edit67 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit67:setParent(obj.rectangle31);
    obj.edit67:setLeft(165);
    obj.edit67:setTop(125);
    obj.edit67:setWidth(50);
    obj.edit67:setHeight(25);
    obj.edit67:setName("edit67");

    obj.edit68 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit68:setParent(obj.rectangle31);
    obj.edit68:setLeft(245);
    obj.edit68:setTop(125);
    obj.edit68:setWidth(100);
    obj.edit68:setHeight(25);
    obj.edit68:setName("edit68");

    obj.rectangle32 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle32:setParent(obj.rectangle31);
    obj.rectangle32:setLeft(355);
    obj.rectangle32:setTop(0);
    obj.rectangle32:setWidth(80);
    obj.rectangle32:setHeight(155);
    obj.rectangle32:setColor("black");
    obj.rectangle32:setName("rectangle32");

    obj.rectangle33 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle33:setParent(obj.rectangle32);
    obj.rectangle33:setHeight(35);
    obj.rectangle33:setAlign("top");
    obj.rectangle33:setMargins({top=3});
    obj.rectangle33:setColor("#0000FF4D");
    obj.rectangle33:setName("rectangle33");

    obj.checkBox1 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox1:setParent(obj.rectangle33);
    obj.checkBox1:setAlign("left");
    obj.checkBox1:setWidth(20);
    obj.checkBox1:setText("Caixa de marcação");
    obj.checkBox1:setField("Fadigado");
    obj.checkBox1:setName("checkBox1");

    obj.Fadigado = GUI.fromHandle(_obj_newObject("label"));
    obj.Fadigado:setParent(obj.rectangle33);
    obj.Fadigado:setName("Fadigado");
    obj.Fadigado:setAlign("left");
    obj.Fadigado:setWidth(80);
    obj.Fadigado:setText("Fadigado");

    obj.rectangle34 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle34:setParent(obj.rectangle32);
    obj.rectangle34:setHeight(35);
    obj.rectangle34:setAlign("top");
    obj.rectangle34:setMargins({top=3});
    obj.rectangle34:setColor("#0000FF4D");
    obj.rectangle34:setName("rectangle34");

    obj.checkBox2 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox2:setParent(obj.rectangle34);
    obj.checkBox2:setAlign("left");
    obj.checkBox2:setWidth(20);
    obj.checkBox2:setText("Caixa de marcação");
    obj.checkBox2:setField("Exausto");
    obj.checkBox2:setName("checkBox2");

    obj.Exausto = GUI.fromHandle(_obj_newObject("label"));
    obj.Exausto:setParent(obj.rectangle34);
    obj.Exausto:setName("Exausto");
    obj.Exausto:setAlign("left");
    obj.Exausto:setWidth(80);
    obj.Exausto:setText("Exausto");

    obj.rectangle35 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle35:setParent(obj.rectangle32);
    obj.rectangle35:setHeight(35);
    obj.rectangle35:setAlign("top");
    obj.rectangle35:setMargins({top=3});
    obj.rectangle35:setColor("#00FF004D");
    obj.rectangle35:setName("rectangle35");

    obj.checkBox3 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox3:setParent(obj.rectangle35);
    obj.checkBox3:setAlign("left");
    obj.checkBox3:setWidth(20);
    obj.checkBox3:setText("Caixa de marcação");
    obj.checkBox3:setField("Frustrado");
    obj.checkBox3:setName("checkBox3");

    obj.Frustrado = GUI.fromHandle(_obj_newObject("label"));
    obj.Frustrado:setParent(obj.rectangle35);
    obj.Frustrado:setName("Frustrado");
    obj.Frustrado:setAlign("left");
    obj.Frustrado:setWidth(80);
    obj.Frustrado:setText("Frustrado");

    obj.rectangle36 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle36:setParent(obj.rectangle32);
    obj.rectangle36:setHeight(35);
    obj.rectangle36:setAlign("top");
    obj.rectangle36:setMargins({top=3});
    obj.rectangle36:setColor("#00FF004D");
    obj.rectangle36:setName("rectangle36");

    obj.checkBox4 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox4:setParent(obj.rectangle36);
    obj.checkBox4:setAlign("left");
    obj.checkBox4:setWidth(20);
    obj.checkBox4:setText("Caixa de marcação");
    obj.checkBox4:setField("Tiltado");
    obj.checkBox4:setName("checkBox4");

    obj.Tiltado = GUI.fromHandle(_obj_newObject("label"));
    obj.Tiltado:setParent(obj.rectangle36);
    obj.Tiltado:setName("Tiltado");
    obj.Tiltado:setAlign("left");
    obj.Tiltado:setWidth(80);
    obj.Tiltado:setText("Tiltado");

    obj.layout53 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout53:setParent(obj.layout52);
    obj.layout53:setLeft(0);
    obj.layout53:setTop(220);
    obj.layout53:setWidth(200);
    obj.layout53:setHeight(500);
    obj.layout53:setName("layout53");

    obj.rectangle37 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle37:setParent(obj.layout53);
    obj.rectangle37:setAlign("top");
    obj.rectangle37:setHeight(40);
    obj.rectangle37:setColor("#1F2328");
    obj.rectangle37:setName("rectangle37");

    obj.label44 = GUI.fromHandle(_obj_newObject("label"));
    obj.label44:setParent(obj.rectangle37);
    obj.label44:setMargins({left=5});
    obj.label44:setHorzTextAlign("center");
    obj.label44:setAlign("left");
    obj.label44:setWidth(100);
    obj.label44:setText("CORPO");
    obj.label44:setName("label44");

    obj.label45 = GUI.fromHandle(_obj_newObject("label"));
    obj.label45:setParent(obj.rectangle37);
    obj.label45:setMargins({left=5});
    obj.label45:setHorzTextAlign("center");
    obj.label45:setAlign("left");
    obj.label45:setWidth(40);
    obj.label45:setText("MOD");
    obj.label45:setName("label45");

    obj.label46 = GUI.fromHandle(_obj_newObject("label"));
    obj.label46:setParent(obj.rectangle37);
    obj.label46:setMargins({left=5});
    obj.label46:setHorzTextAlign("center");
    obj.label46:setAlign("left");
    obj.label46:setWidth(40);
    obj.label46:setText("OUT");
    obj.label46:setName("label46");

    obj.rectangle38 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle38:setParent(obj.layout53);
    obj.rectangle38:setPadding({top=3,bottom=5});
    obj.rectangle38:setAlign("top");
    obj.rectangle38:setHeight(35);
    obj.rectangle38:setColor("black");
    obj.rectangle38:setName("rectangle38");

    obj.AGILIDADE = GUI.fromHandle(_obj_newObject("label"));
    obj.AGILIDADE:setParent(obj.rectangle38);
    obj.AGILIDADE:setMargins({left=5});
    obj.AGILIDADE:setAlign("left");
    obj.AGILIDADE:setHorzTextAlign("center");
    obj.AGILIDADE:setWidth(100);
    obj.AGILIDADE:setText("AGILIDADE");
    obj.AGILIDADE:setName("AGILIDADE");

    obj.edit69 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit69:setParent(obj.rectangle38);
    obj.edit69:setMargins({left=5});
    obj.edit69:setAlign("left");
    obj.edit69:setHorzTextAlign("center");
    obj.edit69:setWidth(40);
    obj.edit69:setField("AGI");
    obj.edit69:setName("edit69");

    obj.edit70 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit70:setParent(obj.rectangle38);
    obj.edit70:setMargins({left=5});
    obj.edit70:setAlign("left");
    obj.edit70:setHorzTextAlign("center");
    obj.edit70:setWidth(40);
    obj.edit70:setField("AGI_OUT");
    obj.edit70:setName("edit70");

    obj.rectangle39 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle39:setParent(obj.layout53);
    obj.rectangle39:setPadding({top=3,bottom=5});
    obj.rectangle39:setAlign("top");
    obj.rectangle39:setHeight(35);
    obj.rectangle39:setColor("black");
    obj.rectangle39:setName("rectangle39");

    obj.DESTREZA = GUI.fromHandle(_obj_newObject("label"));
    obj.DESTREZA:setParent(obj.rectangle39);
    obj.DESTREZA:setMargins({left=5});
    obj.DESTREZA:setAlign("left");
    obj.DESTREZA:setHorzTextAlign("center");
    obj.DESTREZA:setWidth(100);
    obj.DESTREZA:setText("DESTREZA");
    obj.DESTREZA:setName("DESTREZA");

    obj.edit71 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit71:setParent(obj.rectangle39);
    obj.edit71:setMargins({left=5});
    obj.edit71:setAlign("left");
    obj.edit71:setHorzTextAlign("center");
    obj.edit71:setWidth(40);
    obj.edit71:setField("DES");
    obj.edit71:setName("edit71");

    obj.edit72 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit72:setParent(obj.rectangle39);
    obj.edit72:setMargins({left=5});
    obj.edit72:setAlign("left");
    obj.edit72:setHorzTextAlign("center");
    obj.edit72:setWidth(40);
    obj.edit72:setField("DES_OUT");
    obj.edit72:setName("edit72");

    obj.rectangle40 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle40:setParent(obj.layout53);
    obj.rectangle40:setPadding({top=3,bottom=5});
    obj.rectangle40:setAlign("top");
    obj.rectangle40:setHeight(35);
    obj.rectangle40:setColor("black");
    obj.rectangle40:setName("rectangle40");

    obj.FORCA = GUI.fromHandle(_obj_newObject("label"));
    obj.FORCA:setParent(obj.rectangle40);
    obj.FORCA:setMargins({left=5});
    obj.FORCA:setAlign("left");
    obj.FORCA:setHorzTextAlign("center");
    obj.FORCA:setWidth(100);
    obj.FORCA:setText("FORÇA");
    obj.FORCA:setName("FORCA");

    obj.edit73 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit73:setParent(obj.rectangle40);
    obj.edit73:setMargins({left=5});
    obj.edit73:setAlign("left");
    obj.edit73:setHorzTextAlign("center");
    obj.edit73:setWidth(40);
    obj.edit73:setField("FOR");
    obj.edit73:setName("edit73");

    obj.edit74 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit74:setParent(obj.rectangle40);
    obj.edit74:setMargins({left=5});
    obj.edit74:setAlign("left");
    obj.edit74:setHorzTextAlign("center");
    obj.edit74:setWidth(40);
    obj.edit74:setField("FOR_OUT");
    obj.edit74:setName("edit74");

    obj.rectangle41 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle41:setParent(obj.layout53);
    obj.rectangle41:setPadding({top=3,bottom=5});
    obj.rectangle41:setAlign("top");
    obj.rectangle41:setHeight(35);
    obj.rectangle41:setColor("black");
    obj.rectangle41:setName("rectangle41");

    obj.LUTA = GUI.fromHandle(_obj_newObject("label"));
    obj.LUTA:setParent(obj.rectangle41);
    obj.LUTA:setMargins({left=5});
    obj.LUTA:setAlign("left");
    obj.LUTA:setHorzTextAlign("center");
    obj.LUTA:setWidth(100);
    obj.LUTA:setText("LUTA");
    obj.LUTA:setName("LUTA");

    obj.edit75 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit75:setParent(obj.rectangle41);
    obj.edit75:setMargins({left=5});
    obj.edit75:setAlign("left");
    obj.edit75:setHorzTextAlign("center");
    obj.edit75:setWidth(40);
    obj.edit75:setField("LUT");
    obj.edit75:setName("edit75");

    obj.edit76 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit76:setParent(obj.rectangle41);
    obj.edit76:setMargins({left=5});
    obj.edit76:setAlign("left");
    obj.edit76:setHorzTextAlign("center");
    obj.edit76:setWidth(40);
    obj.edit76:setField("LUT_OUT");
    obj.edit76:setName("edit76");

    obj.rectangle42 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle42:setParent(obj.layout53);
    obj.rectangle42:setPadding({top=3,bottom=5});
    obj.rectangle42:setAlign("top");
    obj.rectangle42:setHeight(35);
    obj.rectangle42:setColor("black");
    obj.rectangle42:setName("rectangle42");

    obj.VIGOR = GUI.fromHandle(_obj_newObject("label"));
    obj.VIGOR:setParent(obj.rectangle42);
    obj.VIGOR:setMargins({left=5});
    obj.VIGOR:setAlign("left");
    obj.VIGOR:setHorzTextAlign("center");
    obj.VIGOR:setWidth(100);
    obj.VIGOR:setText("VIGOR");
    obj.VIGOR:setName("VIGOR");

    obj.edit77 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit77:setParent(obj.rectangle42);
    obj.edit77:setMargins({left=5});
    obj.edit77:setAlign("left");
    obj.edit77:setHorzTextAlign("center");
    obj.edit77:setWidth(40);
    obj.edit77:setField("VIG");
    obj.edit77:setName("edit77");

    obj.edit78 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit78:setParent(obj.rectangle42);
    obj.edit78:setMargins({left=5});
    obj.edit78:setAlign("left");
    obj.edit78:setHorzTextAlign("center");
    obj.edit78:setWidth(40);
    obj.edit78:setField("VIG_OUT");
    obj.edit78:setName("edit78");

    obj.rectangle43 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle43:setParent(obj.layout53);
    obj.rectangle43:setAlign("top");
    obj.rectangle43:setMargins({top=15});
    obj.rectangle43:setHeight(40);
    obj.rectangle43:setColor("#1F2328");
    obj.rectangle43:setName("rectangle43");

    obj.label47 = GUI.fromHandle(_obj_newObject("label"));
    obj.label47:setParent(obj.rectangle43);
    obj.label47:setMargins({left=5});
    obj.label47:setHorzTextAlign("center");
    obj.label47:setAlign("left");
    obj.label47:setWidth(100);
    obj.label47:setText("MENTE");
    obj.label47:setName("label47");

    obj.label48 = GUI.fromHandle(_obj_newObject("label"));
    obj.label48:setParent(obj.rectangle43);
    obj.label48:setMargins({left=5});
    obj.label48:setHorzTextAlign("center");
    obj.label48:setAlign("left");
    obj.label48:setWidth(40);
    obj.label48:setText("MOD");
    obj.label48:setName("label48");

    obj.label49 = GUI.fromHandle(_obj_newObject("label"));
    obj.label49:setParent(obj.rectangle43);
    obj.label49:setMargins({left=5});
    obj.label49:setHorzTextAlign("center");
    obj.label49:setAlign("left");
    obj.label49:setWidth(40);
    obj.label49:setText("OUT");
    obj.label49:setName("label49");

    obj.rectangle44 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle44:setParent(obj.layout53);
    obj.rectangle44:setPadding({top=3,bottom=5});
    obj.rectangle44:setAlign("top");
    obj.rectangle44:setHeight(35);
    obj.rectangle44:setColor("black");
    obj.rectangle44:setName("rectangle44");

    obj.INTELIGENCIA = GUI.fromHandle(_obj_newObject("label"));
    obj.INTELIGENCIA:setParent(obj.rectangle44);
    obj.INTELIGENCIA:setMargins({left=5});
    obj.INTELIGENCIA:setAlign("left");
    obj.INTELIGENCIA:setHorzTextAlign("center");
    obj.INTELIGENCIA:setWidth(100);
    obj.INTELIGENCIA:setText("INTELIGÊNCIA");
    obj.INTELIGENCIA:setName("INTELIGENCIA");

    obj.edit79 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit79:setParent(obj.rectangle44);
    obj.edit79:setMargins({left=5});
    obj.edit79:setAlign("left");
    obj.edit79:setHorzTextAlign("center");
    obj.edit79:setWidth(40);
    obj.edit79:setField("INTE");
    obj.edit79:setName("edit79");

    obj.edit80 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit80:setParent(obj.rectangle44);
    obj.edit80:setMargins({left=5});
    obj.edit80:setAlign("left");
    obj.edit80:setHorzTextAlign("center");
    obj.edit80:setWidth(40);
    obj.edit80:setField("INTE_OUT");
    obj.edit80:setName("edit80");

    obj.rectangle45 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle45:setParent(obj.layout53);
    obj.rectangle45:setPadding({top=3,bottom=5});
    obj.rectangle45:setAlign("top");
    obj.rectangle45:setHeight(35);
    obj.rectangle45:setColor("black");
    obj.rectangle45:setName("rectangle45");

    obj.PRESENCA = GUI.fromHandle(_obj_newObject("label"));
    obj.PRESENCA:setParent(obj.rectangle45);
    obj.PRESENCA:setMargins({left=5});
    obj.PRESENCA:setAlign("left");
    obj.PRESENCA:setHorzTextAlign("center");
    obj.PRESENCA:setWidth(100);
    obj.PRESENCA:setText("PRESENÇA");
    obj.PRESENCA:setName("PRESENCA");

    obj.edit81 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit81:setParent(obj.rectangle45);
    obj.edit81:setMargins({left=5});
    obj.edit81:setAlign("left");
    obj.edit81:setHorzTextAlign("center");
    obj.edit81:setWidth(40);
    obj.edit81:setField("PRE");
    obj.edit81:setName("edit81");

    obj.edit82 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit82:setParent(obj.rectangle45);
    obj.edit82:setMargins({left=5});
    obj.edit82:setAlign("left");
    obj.edit82:setHorzTextAlign("center");
    obj.edit82:setWidth(40);
    obj.edit82:setField("PRES_OUT");
    obj.edit82:setName("edit82");

    obj.rectangle46 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle46:setParent(obj.layout53);
    obj.rectangle46:setPadding({top=3,bottom=5});
    obj.rectangle46:setAlign("top");
    obj.rectangle46:setHeight(35);
    obj.rectangle46:setColor("black");
    obj.rectangle46:setName("rectangle46");

    obj.SABEDORIA = GUI.fromHandle(_obj_newObject("label"));
    obj.SABEDORIA:setParent(obj.rectangle46);
    obj.SABEDORIA:setMargins({left=5});
    obj.SABEDORIA:setAlign("left");
    obj.SABEDORIA:setHorzTextAlign("center");
    obj.SABEDORIA:setWidth(100);
    obj.SABEDORIA:setText("SABEDORIA");
    obj.SABEDORIA:setName("SABEDORIA");

    obj.edit83 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit83:setParent(obj.rectangle46);
    obj.edit83:setMargins({left=5});
    obj.edit83:setAlign("left");
    obj.edit83:setHorzTextAlign("center");
    obj.edit83:setWidth(40);
    obj.edit83:setField("SAB");
    obj.edit83:setName("edit83");

    obj.edit84 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit84:setParent(obj.rectangle46);
    obj.edit84:setMargins({left=5});
    obj.edit84:setAlign("left");
    obj.edit84:setHorzTextAlign("center");
    obj.edit84:setWidth(40);
    obj.edit84:setField("SAB_OUT");
    obj.edit84:setName("edit84");

    obj.label50 = GUI.fromHandle(_obj_newObject("label"));
    obj.label50:setParent(obj.layout53);
    obj.label50:setAlign("top");
    obj.label50:setHeight(35);
    obj.label50:setMargins({top=50});
    obj.label50:setText("Ficha na Versão 3.1");
    obj.label50:setName("label50");

    obj.layout54 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout54:setParent(obj.scrollBox2);
    obj.layout54:setLeft(240);
    obj.layout54:setTop(200);
    obj.layout54:setWidth(1300);
    obj.layout54:setHeight(600);
    obj.layout54:setName("layout54");

    obj.layout55 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout55:setParent(obj.layout54);
    obj.layout55:setAlign("top");
    obj.layout55:setHeight(700);
    obj.layout55:setName("layout55");

    obj.tabControl2 = GUI.fromHandle(_obj_newObject("tabControl"));
    obj.tabControl2:setParent(obj.layout55);
    obj.tabControl2:setAlign("left");
    obj.tabControl2:setWidth(350);
    obj.tabControl2:setName("tabControl2");

    obj.tab3 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab3:setParent(obj.tabControl2);
    obj.tab3:setTitle("Corpo");
    obj.tab3:setName("tab3");

    obj.layout56 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout56:setParent(obj.tab3);
    obj.layout56:setHeight(400);
    obj.layout56:setAlign("top");
    obj.layout56:setMargins({left=35});
    obj.layout56:setName("layout56");

    obj.label51 = GUI.fromHandle(_obj_newObject("label"));
    obj.label51:setParent(obj.layout56);
    obj.label51:setAlign("top");
    obj.label51:setHeight(50);
    obj.label51:setText("Corpo");
    obj.label51:setHorzTextAlign("center");
    obj.label51:setFontSize(20);
    obj.label51:setName("label51");

    obj.layout57 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout57:setParent(obj.layout56);
    obj.layout57:setHeight(30);
    obj.layout57:setAlign("top");
    obj.layout57:setMargins({top=3});
    obj.layout57:setName("layout57");

    obj.label52 = GUI.fromHandle(_obj_newObject("label"));
    obj.label52:setParent(obj.layout57);
    obj.label52:setText("Pericias");
    obj.label52:setTop(5);
    obj.label52:setHorzTextAlign("center");
    obj.label52:setAlign("left");
    obj.label52:setName("label52");

    obj.label53 = GUI.fromHandle(_obj_newObject("label"));
    obj.label53:setParent(obj.layout57);
    obj.label53:setText("Atr");
    obj.label53:setAlign("left");
    obj.label53:setMargins({left = 5});
    obj.label53:setWidth(30);
    obj.label53:setHorzTextAlign("center");
    obj.label53:setName("label53");

    obj.label54 = GUI.fromHandle(_obj_newObject("label"));
    obj.label54:setParent(obj.layout57);
    obj.label54:setText("Grad");
    obj.label54:setAlign("left");
    obj.label54:setMargins({left = 5});
    obj.label54:setWidth(30);
    obj.label54:setHorzTextAlign("center");
    obj.label54:setName("label54");

    obj.label55 = GUI.fromHandle(_obj_newObject("label"));
    obj.label55:setParent(obj.layout57);
    obj.label55:setText("Out");
    obj.label55:setAlign("left");
    obj.label55:setMargins({left = 5});
    obj.label55:setWidth(30);
    obj.label55:setHorzTextAlign("center");
    obj.label55:setName("label55");

    obj.label56 = GUI.fromHandle(_obj_newObject("label"));
    obj.label56:setParent(obj.layout57);
    obj.label56:setText("Total");
    obj.label56:setAlign("left");
    obj.label56:setMargins({left = 5});
    obj.label56:setWidth(30);
    obj.label56:setHorzTextAlign("center");
    obj.label56:setName("label56");

    obj.layout58 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout58:setParent(obj.layout56);
    obj.layout58:setHeight(30);
    obj.layout58:setAlign("top");
    obj.layout58:setMargins({top=3});
    obj.layout58:setName("layout58");

    obj.rectangle47 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle47:setParent(obj.layout58);
    obj.rectangle47:setColor("black");
    obj.rectangle47:setAlign("left");
    obj.rectangle47:setWidth(120);
    obj.rectangle47:setName("rectangle47");

    obj.Acrobacia = GUI.fromHandle(_obj_newObject("label"));
    obj.Acrobacia:setParent(obj.rectangle47);
    obj.Acrobacia:setName("Acrobacia");
    obj.Acrobacia:setText("Acrobacia");
    obj.Acrobacia:setTop(5);
    obj.Acrobacia:setHorzTextAlign("center");

    obj.edit85 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit85:setParent(obj.layout58);
    obj.edit85:setField("AGI");
    obj.edit85:setAlign("left");
    obj.edit85:setMargins({left = 5});
    obj.edit85:setWidth(30);
    obj.edit85:setHorzTextAlign("center");
    obj.edit85:setReadOnly(true);
    obj.edit85:setName("edit85");

    obj.edit86 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit86:setParent(obj.layout58);
    obj.edit86:setField("ACR_Grad");
    obj.edit86:setAlign("left");
    obj.edit86:setMargins({left = 5});
    obj.edit86:setWidth(30);
    obj.edit86:setHorzTextAlign("center");
    obj.edit86:setName("edit86");

    obj.edit87 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit87:setParent(obj.layout58);
    obj.edit87:setField("ACR_Out");
    obj.edit87:setAlign("left");
    obj.edit87:setMargins({left = 5});
    obj.edit87:setWidth(30);
    obj.edit87:setHorzTextAlign("center");
    obj.edit87:setName("edit87");

    obj.label57 = GUI.fromHandle(_obj_newObject("label"));
    obj.label57:setParent(obj.layout58);
    obj.label57:setField("ACR_Total");
    obj.label57:setAlign("left");
    obj.label57:setMargins({left = 5});
    obj.label57:setWidth(30);
    obj.label57:setHorzTextAlign("center");
    obj.label57:setName("label57");

    obj.layout59 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout59:setParent(obj.layout56);
    obj.layout59:setHeight(30);
    obj.layout59:setAlign("top");
    obj.layout59:setMargins({top=3});
    obj.layout59:setName("layout59");

    obj.rectangle48 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle48:setParent(obj.layout59);
    obj.rectangle48:setColor("black");
    obj.rectangle48:setAlign("left");
    obj.rectangle48:setWidth(120);
    obj.rectangle48:setName("rectangle48");

    obj.Atletismo = GUI.fromHandle(_obj_newObject("label"));
    obj.Atletismo:setParent(obj.rectangle48);
    obj.Atletismo:setName("Atletismo");
    obj.Atletismo:setText("Atletismo");
    obj.Atletismo:setTop(5);
    obj.Atletismo:setHorzTextAlign("center");

    obj.edit88 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit88:setParent(obj.layout59);
    obj.edit88:setField("FOR");
    obj.edit88:setAlign("left");
    obj.edit88:setMargins({left = 5});
    obj.edit88:setWidth(30);
    obj.edit88:setHorzTextAlign("center");
    obj.edit88:setReadOnly(true);
    obj.edit88:setName("edit88");

    obj.edit89 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit89:setParent(obj.layout59);
    obj.edit89:setField("ATL_Grad");
    obj.edit89:setAlign("left");
    obj.edit89:setMargins({left = 5});
    obj.edit89:setWidth(30);
    obj.edit89:setHorzTextAlign("center");
    obj.edit89:setName("edit89");

    obj.edit90 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit90:setParent(obj.layout59);
    obj.edit90:setField("ATL_Out");
    obj.edit90:setAlign("left");
    obj.edit90:setMargins({left = 5});
    obj.edit90:setWidth(30);
    obj.edit90:setHorzTextAlign("center");
    obj.edit90:setName("edit90");

    obj.label58 = GUI.fromHandle(_obj_newObject("label"));
    obj.label58:setParent(obj.layout59);
    obj.label58:setField("ATL_Total");
    obj.label58:setAlign("left");
    obj.label58:setMargins({left = 5});
    obj.label58:setWidth(30);
    obj.label58:setHorzTextAlign("center");
    obj.label58:setName("label58");

    obj.layout60 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout60:setParent(obj.layout56);
    obj.layout60:setHeight(30);
    obj.layout60:setAlign("top");
    obj.layout60:setMargins({top=3});
    obj.layout60:setName("layout60");

    obj.rectangle49 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle49:setParent(obj.layout60);
    obj.rectangle49:setColor("black");
    obj.rectangle49:setAlign("left");
    obj.rectangle49:setWidth(120);
    obj.rectangle49:setName("rectangle49");

    obj.CorpoACorpo = GUI.fromHandle(_obj_newObject("label"));
    obj.CorpoACorpo:setParent(obj.rectangle49);
    obj.CorpoACorpo:setName("CorpoACorpo");
    obj.CorpoACorpo:setText("Corpo-a-Corpo");
    obj.CorpoACorpo:setTop(5);
    obj.CorpoACorpo:setHorzTextAlign("center");

    obj.edit91 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit91:setParent(obj.layout60);
    obj.edit91:setField("LUT");
    obj.edit91:setAlign("left");
    obj.edit91:setMargins({left = 5});
    obj.edit91:setWidth(30);
    obj.edit91:setHorzTextAlign("center");
    obj.edit91:setReadOnly(true);
    obj.edit91:setName("edit91");

    obj.edit92 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit92:setParent(obj.layout60);
    obj.edit92:setField("COR_Grad");
    obj.edit92:setAlign("left");
    obj.edit92:setMargins({left = 5});
    obj.edit92:setWidth(30);
    obj.edit92:setHorzTextAlign("center");
    obj.edit92:setName("edit92");

    obj.edit93 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit93:setParent(obj.layout60);
    obj.edit93:setField("COR_Out");
    obj.edit93:setAlign("left");
    obj.edit93:setMargins({left = 5});
    obj.edit93:setWidth(30);
    obj.edit93:setHorzTextAlign("center");
    obj.edit93:setName("edit93");

    obj.label59 = GUI.fromHandle(_obj_newObject("label"));
    obj.label59:setParent(obj.layout60);
    obj.label59:setField("COR_Total");
    obj.label59:setAlign("left");
    obj.label59:setMargins({left = 5});
    obj.label59:setWidth(30);
    obj.label59:setHorzTextAlign("center");
    obj.label59:setName("label59");

    obj.layout61 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout61:setParent(obj.layout56);
    obj.layout61:setHeight(30);
    obj.layout61:setAlign("top");
    obj.layout61:setMargins({top=3});
    obj.layout61:setName("layout61");

    obj.rectangle50 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle50:setParent(obj.layout61);
    obj.rectangle50:setColor("black");
    obj.rectangle50:setAlign("left");
    obj.rectangle50:setWidth(120);
    obj.rectangle50:setName("rectangle50");

    obj.Furtividade = GUI.fromHandle(_obj_newObject("label"));
    obj.Furtividade:setParent(obj.rectangle50);
    obj.Furtividade:setName("Furtividade");
    obj.Furtividade:setText("Furtividade");
    obj.Furtividade:setTop(5);
    obj.Furtividade:setHorzTextAlign("center");

    obj.edit94 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit94:setParent(obj.layout61);
    obj.edit94:setField("AGI");
    obj.edit94:setAlign("left");
    obj.edit94:setMargins({left = 5});
    obj.edit94:setWidth(30);
    obj.edit94:setHorzTextAlign("center");
    obj.edit94:setReadOnly(true);
    obj.edit94:setName("edit94");

    obj.edit95 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit95:setParent(obj.layout61);
    obj.edit95:setField("FUR_Grad");
    obj.edit95:setAlign("left");
    obj.edit95:setMargins({left = 5});
    obj.edit95:setWidth(30);
    obj.edit95:setHorzTextAlign("center");
    obj.edit95:setName("edit95");

    obj.edit96 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit96:setParent(obj.layout61);
    obj.edit96:setField("FUR_Out");
    obj.edit96:setAlign("left");
    obj.edit96:setMargins({left = 5});
    obj.edit96:setWidth(30);
    obj.edit96:setHorzTextAlign("center");
    obj.edit96:setName("edit96");

    obj.label60 = GUI.fromHandle(_obj_newObject("label"));
    obj.label60:setParent(obj.layout61);
    obj.label60:setField("FUR_Total");
    obj.label60:setAlign("left");
    obj.label60:setMargins({left = 5});
    obj.label60:setWidth(30);
    obj.label60:setHorzTextAlign("center");
    obj.label60:setName("label60");

    obj.layout62 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout62:setParent(obj.layout56);
    obj.layout62:setHeight(30);
    obj.layout62:setAlign("top");
    obj.layout62:setMargins({top=3});
    obj.layout62:setName("layout62");

    obj.rectangle51 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle51:setParent(obj.layout62);
    obj.rectangle51:setColor("black");
    obj.rectangle51:setAlign("left");
    obj.rectangle51:setWidth(120);
    obj.rectangle51:setName("rectangle51");

    obj.Prestidigitacao = GUI.fromHandle(_obj_newObject("label"));
    obj.Prestidigitacao:setParent(obj.rectangle51);
    obj.Prestidigitacao:setName("Prestidigitacao");
    obj.Prestidigitacao:setText("Prestidigitação");
    obj.Prestidigitacao:setTop(5);
    obj.Prestidigitacao:setHorzTextAlign("center");

    obj.edit97 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit97:setParent(obj.layout62);
    obj.edit97:setField("DES");
    obj.edit97:setAlign("left");
    obj.edit97:setMargins({left = 5});
    obj.edit97:setWidth(30);
    obj.edit97:setHorzTextAlign("center");
    obj.edit97:setReadOnly(true);
    obj.edit97:setName("edit97");

    obj.edit98 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit98:setParent(obj.layout62);
    obj.edit98:setField("PRE_Grad");
    obj.edit98:setAlign("left");
    obj.edit98:setMargins({left = 5});
    obj.edit98:setWidth(30);
    obj.edit98:setHorzTextAlign("center");
    obj.edit98:setName("edit98");

    obj.edit99 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit99:setParent(obj.layout62);
    obj.edit99:setField("PRE_Out");
    obj.edit99:setAlign("left");
    obj.edit99:setMargins({left = 5});
    obj.edit99:setWidth(30);
    obj.edit99:setHorzTextAlign("center");
    obj.edit99:setName("edit99");

    obj.label61 = GUI.fromHandle(_obj_newObject("label"));
    obj.label61:setParent(obj.layout62);
    obj.label61:setField("PRE_Total");
    obj.label61:setAlign("left");
    obj.label61:setMargins({left = 5});
    obj.label61:setWidth(30);
    obj.label61:setHorzTextAlign("center");
    obj.label61:setName("label61");

    obj.layout63 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout63:setParent(obj.layout56);
    obj.layout63:setHeight(30);
    obj.layout63:setAlign("top");
    obj.layout63:setMargins({top=3});
    obj.layout63:setName("layout63");

    obj.rectangle52 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle52:setParent(obj.layout63);
    obj.rectangle52:setColor("black");
    obj.rectangle52:setAlign("left");
    obj.rectangle52:setWidth(120);
    obj.rectangle52:setName("rectangle52");

    obj.VeiculosMagicos = GUI.fromHandle(_obj_newObject("label"));
    obj.VeiculosMagicos:setParent(obj.rectangle52);
    obj.VeiculosMagicos:setName("VeiculosMagicos");
    obj.VeiculosMagicos:setText("Veiculos Mágicos");
    obj.VeiculosMagicos:setTop(5);
    obj.VeiculosMagicos:setHorzTextAlign("center");

    obj.edit100 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit100:setParent(obj.layout63);
    obj.edit100:setField("AGI");
    obj.edit100:setAlign("left");
    obj.edit100:setMargins({left = 5});
    obj.edit100:setWidth(30);
    obj.edit100:setHorzTextAlign("center");
    obj.edit100:setReadOnly(true);
    obj.edit100:setName("edit100");

    obj.edit101 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit101:setParent(obj.layout63);
    obj.edit101:setField("VEI_Grad");
    obj.edit101:setAlign("left");
    obj.edit101:setMargins({left = 5});
    obj.edit101:setWidth(30);
    obj.edit101:setHorzTextAlign("center");
    obj.edit101:setName("edit101");

    obj.edit102 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit102:setParent(obj.layout63);
    obj.edit102:setField("VEI_Out");
    obj.edit102:setAlign("left");
    obj.edit102:setMargins({left = 5});
    obj.edit102:setWidth(30);
    obj.edit102:setHorzTextAlign("center");
    obj.edit102:setName("edit102");

    obj.label62 = GUI.fromHandle(_obj_newObject("label"));
    obj.label62:setParent(obj.layout63);
    obj.label62:setField("VEI_Total");
    obj.label62:setAlign("left");
    obj.label62:setMargins({left = 5});
    obj.label62:setWidth(30);
    obj.label62:setHorzTextAlign("center");
    obj.label62:setName("label62");

    obj.tab4 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab4:setParent(obj.tabControl2);
    obj.tab4:setTitle("Mente");
    obj.tab4:setWidth(134);
    obj.tab4:setName("tab4");

    obj.layout64 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout64:setParent(obj.tab4);
    obj.layout64:setHeight(500);
    obj.layout64:setMargins({left=35});
    obj.layout64:setAlign("top");
    obj.layout64:setName("layout64");

    obj.label63 = GUI.fromHandle(_obj_newObject("label"));
    obj.label63:setParent(obj.layout64);
    obj.label63:setAlign("top");
    obj.label63:setHeight(50);
    obj.label63:setText("Mente");
    obj.label63:setHorzTextAlign("center");
    obj.label63:setFontSize(20);
    obj.label63:setName("label63");

    obj.layout65 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout65:setParent(obj.layout64);
    obj.layout65:setHeight(30);
    obj.layout65:setAlign("top");
    obj.layout65:setMargins({top=3});
    obj.layout65:setName("layout65");

    obj.label64 = GUI.fromHandle(_obj_newObject("label"));
    obj.label64:setParent(obj.layout65);
    obj.label64:setText("Pericias");
    obj.label64:setTop(5);
    obj.label64:setHorzTextAlign("center");
    obj.label64:setAlign("left");
    obj.label64:setName("label64");

    obj.label65 = GUI.fromHandle(_obj_newObject("label"));
    obj.label65:setParent(obj.layout65);
    obj.label65:setText("Atr");
    obj.label65:setAlign("left");
    obj.label65:setMargins({left = 5});
    obj.label65:setWidth(30);
    obj.label65:setHorzTextAlign("center");
    obj.label65:setName("label65");

    obj.label66 = GUI.fromHandle(_obj_newObject("label"));
    obj.label66:setParent(obj.layout65);
    obj.label66:setText("Grad");
    obj.label66:setAlign("left");
    obj.label66:setMargins({left = 5});
    obj.label66:setWidth(30);
    obj.label66:setHorzTextAlign("center");
    obj.label66:setName("label66");

    obj.label67 = GUI.fromHandle(_obj_newObject("label"));
    obj.label67:setParent(obj.layout65);
    obj.label67:setText("Out");
    obj.label67:setAlign("left");
    obj.label67:setMargins({left = 5});
    obj.label67:setWidth(30);
    obj.label67:setHorzTextAlign("center");
    obj.label67:setName("label67");

    obj.label68 = GUI.fromHandle(_obj_newObject("label"));
    obj.label68:setParent(obj.layout65);
    obj.label68:setText("Total");
    obj.label68:setAlign("left");
    obj.label68:setMargins({left = 5});
    obj.label68:setWidth(30);
    obj.label68:setHorzTextAlign("center");
    obj.label68:setName("label68");

    obj.layout66 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout66:setParent(obj.layout64);
    obj.layout66:setHeight(30);
    obj.layout66:setAlign("top");
    obj.layout66:setMargins({top=3});
    obj.layout66:setName("layout66");

    obj.rectangle53 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle53:setParent(obj.layout66);
    obj.rectangle53:setColor("black");
    obj.rectangle53:setAlign("left");
    obj.rectangle53:setWidth(120);
    obj.rectangle53:setName("rectangle53");

    obj.Concentracao = GUI.fromHandle(_obj_newObject("label"));
    obj.Concentracao:setParent(obj.rectangle53);
    obj.Concentracao:setName("Concentracao");
    obj.Concentracao:setText("Concentração");
    obj.Concentracao:setTop(5);
    obj.Concentracao:setHorzTextAlign("center");

    obj.edit103 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit103:setParent(obj.layout66);
    obj.edit103:setField("SAB");
    obj.edit103:setAlign("left");
    obj.edit103:setMargins({left = 5});
    obj.edit103:setWidth(30);
    obj.edit103:setHorzTextAlign("center");
    obj.edit103:setReadOnly(true);
    obj.edit103:setName("edit103");

    obj.edit104 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit104:setParent(obj.layout66);
    obj.edit104:setField("CON_Grad");
    obj.edit104:setAlign("left");
    obj.edit104:setMargins({left = 5});
    obj.edit104:setWidth(30);
    obj.edit104:setHorzTextAlign("center");
    obj.edit104:setName("edit104");

    obj.edit105 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit105:setParent(obj.layout66);
    obj.edit105:setField("CON_Out");
    obj.edit105:setAlign("left");
    obj.edit105:setMargins({left = 5});
    obj.edit105:setWidth(30);
    obj.edit105:setHorzTextAlign("center");
    obj.edit105:setName("edit105");

    obj.label69 = GUI.fromHandle(_obj_newObject("label"));
    obj.label69:setParent(obj.layout66);
    obj.label69:setField("CON_Total");
    obj.label69:setAlign("left");
    obj.label69:setMargins({left = 5});
    obj.label69:setWidth(30);
    obj.label69:setHorzTextAlign("center");
    obj.label69:setName("label69");

    obj.layout67 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout67:setParent(obj.layout64);
    obj.layout67:setHeight(30);
    obj.layout67:setAlign("top");
    obj.layout67:setMargins({top=3});
    obj.layout67:setName("layout67");

    obj.rectangle54 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle54:setParent(obj.layout67);
    obj.rectangle54:setColor("black");
    obj.rectangle54:setAlign("left");
    obj.rectangle54:setWidth(120);
    obj.rectangle54:setName("rectangle54");

    obj.Enganacao = GUI.fromHandle(_obj_newObject("label"));
    obj.Enganacao:setParent(obj.rectangle54);
    obj.Enganacao:setName("Enganacao");
    obj.Enganacao:setText("Enganação");
    obj.Enganacao:setTop(5);
    obj.Enganacao:setHorzTextAlign("center");

    obj.edit106 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit106:setParent(obj.layout67);
    obj.edit106:setField("PRE");
    obj.edit106:setAlign("left");
    obj.edit106:setMargins({left = 5});
    obj.edit106:setWidth(30);
    obj.edit106:setHorzTextAlign("center");
    obj.edit106:setReadOnly(true);
    obj.edit106:setName("edit106");

    obj.edit107 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit107:setParent(obj.layout67);
    obj.edit107:setField("ENG_Grad");
    obj.edit107:setAlign("left");
    obj.edit107:setMargins({left = 5});
    obj.edit107:setWidth(30);
    obj.edit107:setHorzTextAlign("center");
    obj.edit107:setName("edit107");

    obj.edit108 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit108:setParent(obj.layout67);
    obj.edit108:setField("ENG_Out");
    obj.edit108:setAlign("left");
    obj.edit108:setMargins({left = 5});
    obj.edit108:setWidth(30);
    obj.edit108:setHorzTextAlign("center");
    obj.edit108:setName("edit108");

    obj.label70 = GUI.fromHandle(_obj_newObject("label"));
    obj.label70:setParent(obj.layout67);
    obj.label70:setField("ENG_Total");
    obj.label70:setAlign("left");
    obj.label70:setMargins({left = 5});
    obj.label70:setWidth(30);
    obj.label70:setHorzTextAlign("center");
    obj.label70:setName("label70");

    obj.layout68 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout68:setParent(obj.layout64);
    obj.layout68:setHeight(30);
    obj.layout68:setAlign("top");
    obj.layout68:setMargins({top=3});
    obj.layout68:setName("layout68");

    obj.rectangle55 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle55:setParent(obj.layout68);
    obj.rectangle55:setColor("black");
    obj.rectangle55:setAlign("left");
    obj.rectangle55:setWidth(120);
    obj.rectangle55:setName("rectangle55");

    obj.Intimidacao = GUI.fromHandle(_obj_newObject("label"));
    obj.Intimidacao:setParent(obj.rectangle55);
    obj.Intimidacao:setName("Intimidacao");
    obj.Intimidacao:setText("Intimidação");
    obj.Intimidacao:setTop(5);
    obj.Intimidacao:setHorzTextAlign("center");

    obj.edit109 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit109:setParent(obj.layout68);
    obj.edit109:setField("PRE");
    obj.edit109:setAlign("left");
    obj.edit109:setMargins({left = 5});
    obj.edit109:setWidth(30);
    obj.edit109:setHorzTextAlign("center");
    obj.edit109:setReadOnly(true);
    obj.edit109:setName("edit109");

    obj.edit110 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit110:setParent(obj.layout68);
    obj.edit110:setField("INT_Grad");
    obj.edit110:setAlign("left");
    obj.edit110:setMargins({left = 5});
    obj.edit110:setWidth(30);
    obj.edit110:setHorzTextAlign("center");
    obj.edit110:setName("edit110");

    obj.edit111 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit111:setParent(obj.layout68);
    obj.edit111:setField("INT_Out");
    obj.edit111:setAlign("left");
    obj.edit111:setMargins({left = 5});
    obj.edit111:setWidth(30);
    obj.edit111:setHorzTextAlign("center");
    obj.edit111:setName("edit111");

    obj.label71 = GUI.fromHandle(_obj_newObject("label"));
    obj.label71:setParent(obj.layout68);
    obj.label71:setField("INT_Total");
    obj.label71:setAlign("left");
    obj.label71:setMargins({left = 5});
    obj.label71:setWidth(30);
    obj.label71:setHorzTextAlign("center");
    obj.label71:setName("label71");

    obj.layout69 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout69:setParent(obj.layout64);
    obj.layout69:setHeight(30);
    obj.layout69:setAlign("top");
    obj.layout69:setMargins({top=3});
    obj.layout69:setName("layout69");

    obj.rectangle56 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle56:setParent(obj.layout69);
    obj.rectangle56:setColor("black");
    obj.rectangle56:setAlign("left");
    obj.rectangle56:setWidth(120);
    obj.rectangle56:setName("rectangle56");

    obj.Intuicao = GUI.fromHandle(_obj_newObject("label"));
    obj.Intuicao:setParent(obj.rectangle56);
    obj.Intuicao:setName("Intuicao");
    obj.Intuicao:setText("Intuição");
    obj.Intuicao:setTop(5);
    obj.Intuicao:setHorzTextAlign("center");

    obj.edit112 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit112:setParent(obj.layout69);
    obj.edit112:setField("SAB");
    obj.edit112:setAlign("left");
    obj.edit112:setMargins({left = 5});
    obj.edit112:setWidth(30);
    obj.edit112:setHorzTextAlign("center");
    obj.edit112:setReadOnly(true);
    obj.edit112:setName("edit112");

    obj.edit113 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit113:setParent(obj.layout69);
    obj.edit113:setField("INTU_Grad");
    obj.edit113:setAlign("left");
    obj.edit113:setMargins({left = 5});
    obj.edit113:setWidth(30);
    obj.edit113:setHorzTextAlign("center");
    obj.edit113:setName("edit113");

    obj.edit114 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit114:setParent(obj.layout69);
    obj.edit114:setField("INTU_Out");
    obj.edit114:setAlign("left");
    obj.edit114:setMargins({left = 5});
    obj.edit114:setWidth(30);
    obj.edit114:setHorzTextAlign("center");
    obj.edit114:setName("edit114");

    obj.label72 = GUI.fromHandle(_obj_newObject("label"));
    obj.label72:setParent(obj.layout69);
    obj.label72:setField("INTU_Total");
    obj.label72:setAlign("left");
    obj.label72:setMargins({left = 5});
    obj.label72:setWidth(30);
    obj.label72:setHorzTextAlign("center");
    obj.label72:setName("label72");

    obj.layout70 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout70:setParent(obj.layout64);
    obj.layout70:setHeight(30);
    obj.layout70:setAlign("top");
    obj.layout70:setMargins({top=3});
    obj.layout70:setName("layout70");

    obj.rectangle57 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle57:setParent(obj.layout70);
    obj.rectangle57:setColor("black");
    obj.rectangle57:setAlign("left");
    obj.rectangle57:setWidth(120);
    obj.rectangle57:setName("rectangle57");

    obj.Investigacao = GUI.fromHandle(_obj_newObject("label"));
    obj.Investigacao:setParent(obj.rectangle57);
    obj.Investigacao:setName("Investigacao");
    obj.Investigacao:setText("Investigação");
    obj.Investigacao:setTop(5);
    obj.Investigacao:setHorzTextAlign("center");

    obj.edit115 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit115:setParent(obj.layout70);
    obj.edit115:setField("INTE");
    obj.edit115:setAlign("left");
    obj.edit115:setMargins({left = 5});
    obj.edit115:setWidth(30);
    obj.edit115:setHorzTextAlign("center");
    obj.edit115:setReadOnly(true);
    obj.edit115:setName("edit115");

    obj.edit116 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit116:setParent(obj.layout70);
    obj.edit116:setField("INV_Grad");
    obj.edit116:setAlign("left");
    obj.edit116:setMargins({left = 5});
    obj.edit116:setWidth(30);
    obj.edit116:setHorzTextAlign("center");
    obj.edit116:setName("edit116");

    obj.edit117 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit117:setParent(obj.layout70);
    obj.edit117:setField("INV_Out");
    obj.edit117:setAlign("left");
    obj.edit117:setMargins({left = 5});
    obj.edit117:setWidth(30);
    obj.edit117:setHorzTextAlign("center");
    obj.edit117:setName("edit117");

    obj.label73 = GUI.fromHandle(_obj_newObject("label"));
    obj.label73:setParent(obj.layout70);
    obj.label73:setField("INV_Total");
    obj.label73:setAlign("left");
    obj.label73:setMargins({left = 5});
    obj.label73:setWidth(30);
    obj.label73:setHorzTextAlign("center");
    obj.label73:setName("label73");

    obj.layout71 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout71:setParent(obj.layout64);
    obj.layout71:setHeight(30);
    obj.layout71:setAlign("top");
    obj.layout71:setMargins({top=3});
    obj.layout71:setName("layout71");

    obj.rectangle58 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle58:setParent(obj.layout71);
    obj.rectangle58:setColor("black");
    obj.rectangle58:setAlign("left");
    obj.rectangle58:setWidth(120);
    obj.rectangle58:setName("rectangle58");

    obj.Percepcao = GUI.fromHandle(_obj_newObject("label"));
    obj.Percepcao:setParent(obj.rectangle58);
    obj.Percepcao:setName("Percepcao");
    obj.Percepcao:setText("Percepção");
    obj.Percepcao:setTop(5);
    obj.Percepcao:setHorzTextAlign("center");

    obj.edit118 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit118:setParent(obj.layout71);
    obj.edit118:setField("SAB");
    obj.edit118:setAlign("left");
    obj.edit118:setMargins({left = 5});
    obj.edit118:setWidth(30);
    obj.edit118:setHorzTextAlign("center");
    obj.edit118:setReadOnly(true);
    obj.edit118:setName("edit118");

    obj.edit119 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit119:setParent(obj.layout71);
    obj.edit119:setField("PERC_Grad");
    obj.edit119:setAlign("left");
    obj.edit119:setMargins({left = 5});
    obj.edit119:setWidth(30);
    obj.edit119:setHorzTextAlign("center");
    obj.edit119:setName("edit119");

    obj.edit120 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit120:setParent(obj.layout71);
    obj.edit120:setField("PERC_Out");
    obj.edit120:setAlign("left");
    obj.edit120:setMargins({left = 5});
    obj.edit120:setWidth(30);
    obj.edit120:setHorzTextAlign("center");
    obj.edit120:setName("edit120");

    obj.label74 = GUI.fromHandle(_obj_newObject("label"));
    obj.label74:setParent(obj.layout71);
    obj.label74:setField("PERC_Total");
    obj.label74:setAlign("left");
    obj.label74:setMargins({left = 5});
    obj.label74:setWidth(30);
    obj.label74:setHorzTextAlign("center");
    obj.label74:setName("label74");

    obj.layout72 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout72:setParent(obj.layout64);
    obj.layout72:setHeight(30);
    obj.layout72:setAlign("top");
    obj.layout72:setMargins({top=3});
    obj.layout72:setName("layout72");

    obj.rectangle59 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle59:setParent(obj.layout72);
    obj.rectangle59:setColor("black");
    obj.rectangle59:setAlign("left");
    obj.rectangle59:setWidth(120);
    obj.rectangle59:setName("rectangle59");

    obj.Persuacao = GUI.fromHandle(_obj_newObject("label"));
    obj.Persuacao:setParent(obj.rectangle59);
    obj.Persuacao:setName("Persuacao");
    obj.Persuacao:setText("Persuação");
    obj.Persuacao:setTop(5);
    obj.Persuacao:setHorzTextAlign("center");

    obj.edit121 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit121:setParent(obj.layout72);
    obj.edit121:setField("PRE");
    obj.edit121:setAlign("left");
    obj.edit121:setMargins({left = 5});
    obj.edit121:setWidth(30);
    obj.edit121:setHorzTextAlign("center");
    obj.edit121:setReadOnly(true);
    obj.edit121:setName("edit121");

    obj.edit122 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit122:setParent(obj.layout72);
    obj.edit122:setField("PERS_Grad");
    obj.edit122:setAlign("left");
    obj.edit122:setMargins({left = 5});
    obj.edit122:setWidth(30);
    obj.edit122:setHorzTextAlign("center");
    obj.edit122:setName("edit122");

    obj.edit123 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit123:setParent(obj.layout72);
    obj.edit123:setField("PERS_Out");
    obj.edit123:setAlign("left");
    obj.edit123:setMargins({left = 5});
    obj.edit123:setWidth(30);
    obj.edit123:setHorzTextAlign("center");
    obj.edit123:setName("edit123");

    obj.label75 = GUI.fromHandle(_obj_newObject("label"));
    obj.label75:setParent(obj.layout72);
    obj.label75:setField("PERS_Total");
    obj.label75:setAlign("left");
    obj.label75:setMargins({left = 5});
    obj.label75:setWidth(30);
    obj.label75:setHorzTextAlign("center");
    obj.label75:setName("label75");

    obj.layout73 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout73:setParent(obj.layout64);
    obj.layout73:setHeight(30);
    obj.layout73:setAlign("top");
    obj.layout73:setMargins({top=3});
    obj.layout73:setName("layout73");

    obj.rectangle60 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle60:setParent(obj.layout73);
    obj.rectangle60:setColor("black");
    obj.rectangle60:setAlign("left");
    obj.rectangle60:setWidth(120);
    obj.rectangle60:setName("rectangle60");

    obj.Tratamento = GUI.fromHandle(_obj_newObject("label"));
    obj.Tratamento:setParent(obj.rectangle60);
    obj.Tratamento:setName("Tratamento");
    obj.Tratamento:setText("Tratamento");
    obj.Tratamento:setTop(5);
    obj.Tratamento:setHorzTextAlign("center");

    obj.edit124 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit124:setParent(obj.layout73);
    obj.edit124:setField("INTE");
    obj.edit124:setAlign("left");
    obj.edit124:setMargins({left = 5});
    obj.edit124:setWidth(30);
    obj.edit124:setHorzTextAlign("center");
    obj.edit124:setReadOnly(true);
    obj.edit124:setName("edit124");

    obj.edit125 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit125:setParent(obj.layout73);
    obj.edit125:setField("TRA_Grad");
    obj.edit125:setAlign("left");
    obj.edit125:setMargins({left = 5});
    obj.edit125:setWidth(30);
    obj.edit125:setHorzTextAlign("center");
    obj.edit125:setName("edit125");

    obj.edit126 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit126:setParent(obj.layout73);
    obj.edit126:setField("TRA_Out");
    obj.edit126:setAlign("left");
    obj.edit126:setMargins({left = 5});
    obj.edit126:setWidth(30);
    obj.edit126:setHorzTextAlign("center");
    obj.edit126:setName("edit126");

    obj.label76 = GUI.fromHandle(_obj_newObject("label"));
    obj.label76:setParent(obj.layout73);
    obj.label76:setField("TRA_Total");
    obj.label76:setAlign("left");
    obj.label76:setMargins({left = 5});
    obj.label76:setWidth(30);
    obj.label76:setHorzTextAlign("center");
    obj.label76:setName("label76");

    obj.tab5 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab5:setParent(obj.tabControl2);
    obj.tab5:setTitle("Conhecimentos");
    obj.tab5:setName("tab5");

    obj.layout74 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout74:setParent(obj.tab5);
    obj.layout74:setHeight(600);
    obj.layout74:setMargins({left=35});
    obj.layout74:setAlign("top");
    obj.layout74:setName("layout74");

    obj.label77 = GUI.fromHandle(_obj_newObject("label"));
    obj.label77:setParent(obj.layout74);
    obj.label77:setAlign("top");
    obj.label77:setHeight(50);
    obj.label77:setText("Conhecimentos");
    obj.label77:setHorzTextAlign("center");
    obj.label77:setFontSize(20);
    obj.label77:setName("label77");

    obj.layout75 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout75:setParent(obj.layout74);
    obj.layout75:setHeight(30);
    obj.layout75:setAlign("top");
    obj.layout75:setMargins({top=3});
    obj.layout75:setName("layout75");

    obj.label78 = GUI.fromHandle(_obj_newObject("label"));
    obj.label78:setParent(obj.layout75);
    obj.label78:setText("Pericias");
    obj.label78:setTop(5);
    obj.label78:setHorzTextAlign("center");
    obj.label78:setAlign("left");
    obj.label78:setName("label78");

    obj.label79 = GUI.fromHandle(_obj_newObject("label"));
    obj.label79:setParent(obj.layout75);
    obj.label79:setText("Atr");
    obj.label79:setAlign("left");
    obj.label79:setMargins({left = 5});
    obj.label79:setWidth(30);
    obj.label79:setHorzTextAlign("center");
    obj.label79:setName("label79");

    obj.label80 = GUI.fromHandle(_obj_newObject("label"));
    obj.label80:setParent(obj.layout75);
    obj.label80:setText("Grad");
    obj.label80:setAlign("left");
    obj.label80:setMargins({left = 5});
    obj.label80:setWidth(30);
    obj.label80:setHorzTextAlign("center");
    obj.label80:setName("label80");

    obj.label81 = GUI.fromHandle(_obj_newObject("label"));
    obj.label81:setParent(obj.layout75);
    obj.label81:setText("Out");
    obj.label81:setAlign("left");
    obj.label81:setMargins({left = 5});
    obj.label81:setWidth(30);
    obj.label81:setHorzTextAlign("center");
    obj.label81:setName("label81");

    obj.label82 = GUI.fromHandle(_obj_newObject("label"));
    obj.label82:setParent(obj.layout75);
    obj.label82:setText("Total");
    obj.label82:setAlign("left");
    obj.label82:setMargins({left = 5});
    obj.label82:setWidth(30);
    obj.label82:setHorzTextAlign("center");
    obj.label82:setName("label82");

    obj.layout76 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout76:setParent(obj.layout74);
    obj.layout76:setHeight(30);
    obj.layout76:setAlign("top");
    obj.layout76:setMargins({top=3});
    obj.layout76:setName("layout76");

    obj.rectangle61 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle61:setParent(obj.layout76);
    obj.rectangle61:setColor("black");
    obj.rectangle61:setAlign("left");
    obj.rectangle61:setWidth(120);
    obj.rectangle61:setName("rectangle61");

    obj.Atualidades = GUI.fromHandle(_obj_newObject("label"));
    obj.Atualidades:setParent(obj.rectangle61);
    obj.Atualidades:setName("Atualidades");
    obj.Atualidades:setText("Atualidades");
    obj.Atualidades:setTop(5);
    obj.Atualidades:setHorzTextAlign("center");

    obj.edit127 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit127:setParent(obj.layout76);
    obj.edit127:setField("INTE");
    obj.edit127:setAlign("left");
    obj.edit127:setMargins({left = 5});
    obj.edit127:setWidth(30);
    obj.edit127:setHorzTextAlign("center");
    obj.edit127:setReadOnly(true);
    obj.edit127:setName("edit127");

    obj.edit128 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit128:setParent(obj.layout76);
    obj.edit128:setField("ATU_Grad");
    obj.edit128:setAlign("left");
    obj.edit128:setMargins({left = 5});
    obj.edit128:setWidth(30);
    obj.edit128:setHorzTextAlign("center");
    obj.edit128:setName("edit128");

    obj.edit129 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit129:setParent(obj.layout76);
    obj.edit129:setField("ATU_Out");
    obj.edit129:setAlign("left");
    obj.edit129:setMargins({left = 5});
    obj.edit129:setWidth(30);
    obj.edit129:setHorzTextAlign("center");
    obj.edit129:setName("edit129");

    obj.label83 = GUI.fromHandle(_obj_newObject("label"));
    obj.label83:setParent(obj.layout76);
    obj.label83:setField("ATU_Total");
    obj.label83:setAlign("left");
    obj.label83:setMargins({left = 5});
    obj.label83:setWidth(30);
    obj.label83:setHorzTextAlign("center");
    obj.label83:setName("label83");

    obj.layout77 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout77:setParent(obj.layout74);
    obj.layout77:setHeight(30);
    obj.layout77:setAlign("top");
    obj.layout77:setMargins({top=3});
    obj.layout77:setName("layout77");

    obj.rectangle62 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle62:setParent(obj.layout77);
    obj.rectangle62:setColor("black");
    obj.rectangle62:setAlign("left");
    obj.rectangle62:setWidth(120);
    obj.rectangle62:setName("rectangle62");

    obj.Adivinhacao = GUI.fromHandle(_obj_newObject("label"));
    obj.Adivinhacao:setParent(obj.rectangle62);
    obj.Adivinhacao:setName("Adivinhacao");
    obj.Adivinhacao:setText("Adivinhação");
    obj.Adivinhacao:setTop(5);
    obj.Adivinhacao:setHorzTextAlign("center");

    obj.edit130 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit130:setParent(obj.layout77);
    obj.edit130:setField("INTE");
    obj.edit130:setAlign("left");
    obj.edit130:setMargins({left = 5});
    obj.edit130:setWidth(30);
    obj.edit130:setHorzTextAlign("center");
    obj.edit130:setReadOnly(true);
    obj.edit130:setName("edit130");

    obj.edit131 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit131:setParent(obj.layout77);
    obj.edit131:setField("C_ADI_Grad");
    obj.edit131:setAlign("left");
    obj.edit131:setMargins({left = 5});
    obj.edit131:setWidth(30);
    obj.edit131:setHorzTextAlign("center");
    obj.edit131:setName("edit131");

    obj.edit132 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit132:setParent(obj.layout77);
    obj.edit132:setField("C_ADI_Out");
    obj.edit132:setAlign("left");
    obj.edit132:setMargins({left = 5});
    obj.edit132:setWidth(30);
    obj.edit132:setHorzTextAlign("center");
    obj.edit132:setName("edit132");

    obj.label84 = GUI.fromHandle(_obj_newObject("label"));
    obj.label84:setParent(obj.layout77);
    obj.label84:setField("C_ADI_Total");
    obj.label84:setAlign("left");
    obj.label84:setMargins({left = 5});
    obj.label84:setWidth(30);
    obj.label84:setHorzTextAlign("center");
    obj.label84:setName("label84");

    obj.layout78 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout78:setParent(obj.layout74);
    obj.layout78:setHeight(30);
    obj.layout78:setAlign("top");
    obj.layout78:setMargins({top=3});
    obj.layout78:setName("layout78");

    obj.rectangle63 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle63:setParent(obj.layout78);
    obj.rectangle63:setColor("black");
    obj.rectangle63:setAlign("left");
    obj.rectangle63:setWidth(120);
    obj.rectangle63:setName("rectangle63");

    obj.Azaracao = GUI.fromHandle(_obj_newObject("label"));
    obj.Azaracao:setParent(obj.rectangle63);
    obj.Azaracao:setName("Azaracao");
    obj.Azaracao:setText("Azaração");
    obj.Azaracao:setTop(5);
    obj.Azaracao:setHorzTextAlign("center");

    obj.edit133 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit133:setParent(obj.layout78);
    obj.edit133:setField("INTE");
    obj.edit133:setAlign("left");
    obj.edit133:setMargins({left = 5});
    obj.edit133:setWidth(30);
    obj.edit133:setHorzTextAlign("center");
    obj.edit133:setReadOnly(true);
    obj.edit133:setName("edit133");

    obj.edit134 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit134:setParent(obj.layout78);
    obj.edit134:setField("C_AZA_Grad");
    obj.edit134:setAlign("left");
    obj.edit134:setMargins({left = 5});
    obj.edit134:setWidth(30);
    obj.edit134:setHorzTextAlign("center");
    obj.edit134:setName("edit134");

    obj.edit135 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit135:setParent(obj.layout78);
    obj.edit135:setField("C_AZA_Out");
    obj.edit135:setAlign("left");
    obj.edit135:setMargins({left = 5});
    obj.edit135:setWidth(30);
    obj.edit135:setHorzTextAlign("center");
    obj.edit135:setName("edit135");

    obj.label85 = GUI.fromHandle(_obj_newObject("label"));
    obj.label85:setParent(obj.layout78);
    obj.label85:setField("C_AZA_Total");
    obj.label85:setAlign("left");
    obj.label85:setMargins({left = 5});
    obj.label85:setWidth(30);
    obj.label85:setHorzTextAlign("center");
    obj.label85:setName("label85");

    obj.layout79 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout79:setParent(obj.layout74);
    obj.layout79:setHeight(30);
    obj.layout79:setAlign("top");
    obj.layout79:setMargins({top=3});
    obj.layout79:setName("layout79");

    obj.rectangle64 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle64:setParent(obj.layout79);
    obj.rectangle64:setColor("black");
    obj.rectangle64:setAlign("left");
    obj.rectangle64:setWidth(120);
    obj.rectangle64:setName("rectangle64");

    obj.ContraFeitico = GUI.fromHandle(_obj_newObject("label"));
    obj.ContraFeitico:setParent(obj.rectangle64);
    obj.ContraFeitico:setName("ContraFeitico");
    obj.ContraFeitico:setText("Contra-Feitiço");
    obj.ContraFeitico:setTop(5);
    obj.ContraFeitico:setHorzTextAlign("center");

    obj.edit136 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit136:setParent(obj.layout79);
    obj.edit136:setField("INTE");
    obj.edit136:setAlign("left");
    obj.edit136:setMargins({left = 5});
    obj.edit136:setWidth(30);
    obj.edit136:setHorzTextAlign("center");
    obj.edit136:setReadOnly(true);
    obj.edit136:setName("edit136");

    obj.edit137 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit137:setParent(obj.layout79);
    obj.edit137:setField("C_CON_Grad");
    obj.edit137:setAlign("left");
    obj.edit137:setMargins({left = 5});
    obj.edit137:setWidth(30);
    obj.edit137:setHorzTextAlign("center");
    obj.edit137:setName("edit137");

    obj.edit138 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit138:setParent(obj.layout79);
    obj.edit138:setField("C_CON_Out");
    obj.edit138:setAlign("left");
    obj.edit138:setMargins({left = 5});
    obj.edit138:setWidth(30);
    obj.edit138:setHorzTextAlign("center");
    obj.edit138:setName("edit138");

    obj.label86 = GUI.fromHandle(_obj_newObject("label"));
    obj.label86:setParent(obj.layout79);
    obj.label86:setField("C_CON_Total");
    obj.label86:setAlign("left");
    obj.label86:setMargins({left = 5});
    obj.label86:setWidth(30);
    obj.label86:setHorzTextAlign("center");
    obj.label86:setName("label86");

    obj.layout80 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout80:setParent(obj.layout74);
    obj.layout80:setHeight(30);
    obj.layout80:setAlign("top");
    obj.layout80:setMargins({top=3});
    obj.layout80:setName("layout80");

    obj.rectangle65 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle65:setParent(obj.layout80);
    obj.rectangle65:setColor("black");
    obj.rectangle65:setAlign("left");
    obj.rectangle65:setWidth(120);
    obj.rectangle65:setName("rectangle65");

    obj.CriaturasMagicas = GUI.fromHandle(_obj_newObject("label"));
    obj.CriaturasMagicas:setParent(obj.rectangle65);
    obj.CriaturasMagicas:setName("CriaturasMagicas");
    obj.CriaturasMagicas:setText("Criaturas Mágicas");
    obj.CriaturasMagicas:setTop(5);
    obj.CriaturasMagicas:setHorzTextAlign("center");

    obj.edit139 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit139:setParent(obj.layout80);
    obj.edit139:setField("INTE");
    obj.edit139:setAlign("left");
    obj.edit139:setMargins({left = 5});
    obj.edit139:setWidth(30);
    obj.edit139:setHorzTextAlign("center");
    obj.edit139:setReadOnly(true);
    obj.edit139:setName("edit139");

    obj.edit140 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit140:setParent(obj.layout80);
    obj.edit140:setField("C_CRI_Grad");
    obj.edit140:setAlign("left");
    obj.edit140:setMargins({left = 5});
    obj.edit140:setWidth(30);
    obj.edit140:setHorzTextAlign("center");
    obj.edit140:setName("edit140");

    obj.edit141 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit141:setParent(obj.layout80);
    obj.edit141:setField("C_CRI_Out");
    obj.edit141:setAlign("left");
    obj.edit141:setMargins({left = 5});
    obj.edit141:setWidth(30);
    obj.edit141:setHorzTextAlign("center");
    obj.edit141:setName("edit141");

    obj.label87 = GUI.fromHandle(_obj_newObject("label"));
    obj.label87:setParent(obj.layout80);
    obj.label87:setField("C_CRI_Total");
    obj.label87:setAlign("left");
    obj.label87:setMargins({left = 5});
    obj.label87:setWidth(30);
    obj.label87:setHorzTextAlign("center");
    obj.label87:setName("label87");

    obj.layout81 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout81:setParent(obj.layout74);
    obj.layout81:setHeight(30);
    obj.layout81:setAlign("top");
    obj.layout81:setMargins({top=3});
    obj.layout81:setName("layout81");

    obj.rectangle66 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle66:setParent(obj.layout81);
    obj.rectangle66:setColor("black");
    obj.rectangle66:setAlign("left");
    obj.rectangle66:setWidth(120);
    obj.rectangle66:setName("rectangle66");

    obj.Encantamentos = GUI.fromHandle(_obj_newObject("label"));
    obj.Encantamentos:setParent(obj.rectangle66);
    obj.Encantamentos:setName("Encantamentos");
    obj.Encantamentos:setText("Encantamentos");
    obj.Encantamentos:setTop(5);
    obj.Encantamentos:setHorzTextAlign("center");

    obj.edit142 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit142:setParent(obj.layout81);
    obj.edit142:setField("INTE");
    obj.edit142:setAlign("left");
    obj.edit142:setMargins({left = 5});
    obj.edit142:setWidth(30);
    obj.edit142:setHorzTextAlign("center");
    obj.edit142:setReadOnly(true);
    obj.edit142:setName("edit142");

    obj.edit143 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit143:setParent(obj.layout81);
    obj.edit143:setField("C_ENC_Grad");
    obj.edit143:setAlign("left");
    obj.edit143:setMargins({left = 5});
    obj.edit143:setWidth(30);
    obj.edit143:setHorzTextAlign("center");
    obj.edit143:setName("edit143");

    obj.edit144 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit144:setParent(obj.layout81);
    obj.edit144:setField("C_ENC_Out");
    obj.edit144:setAlign("left");
    obj.edit144:setMargins({left = 5});
    obj.edit144:setWidth(30);
    obj.edit144:setHorzTextAlign("center");
    obj.edit144:setName("edit144");

    obj.label88 = GUI.fromHandle(_obj_newObject("label"));
    obj.label88:setParent(obj.layout81);
    obj.label88:setField("C_ENC_Total");
    obj.label88:setAlign("left");
    obj.label88:setMargins({left = 5});
    obj.label88:setWidth(30);
    obj.label88:setHorzTextAlign("center");
    obj.label88:setName("label88");

    obj.layout82 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout82:setParent(obj.layout74);
    obj.layout82:setHeight(30);
    obj.layout82:setAlign("top");
    obj.layout82:setMargins({top=3});
    obj.layout82:setName("layout82");

    obj.rectangle67 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle67:setParent(obj.layout82);
    obj.rectangle67:setColor("black");
    obj.rectangle67:setAlign("left");
    obj.rectangle67:setWidth(120);
    obj.rectangle67:setName("rectangle67");

    obj.Feiticos = GUI.fromHandle(_obj_newObject("label"));
    obj.Feiticos:setParent(obj.rectangle67);
    obj.Feiticos:setName("Feiticos");
    obj.Feiticos:setText("Feitiços");
    obj.Feiticos:setTop(5);
    obj.Feiticos:setHorzTextAlign("center");

    obj.edit145 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit145:setParent(obj.layout82);
    obj.edit145:setField("INTE");
    obj.edit145:setAlign("left");
    obj.edit145:setMargins({left = 5});
    obj.edit145:setWidth(30);
    obj.edit145:setHorzTextAlign("center");
    obj.edit145:setReadOnly(true);
    obj.edit145:setName("edit145");

    obj.edit146 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit146:setParent(obj.layout82);
    obj.edit146:setField("C_FEI_Grad");
    obj.edit146:setAlign("left");
    obj.edit146:setMargins({left = 5});
    obj.edit146:setWidth(30);
    obj.edit146:setHorzTextAlign("center");
    obj.edit146:setName("edit146");

    obj.edit147 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit147:setParent(obj.layout82);
    obj.edit147:setField("C_FEI_Out");
    obj.edit147:setAlign("left");
    obj.edit147:setMargins({left = 5});
    obj.edit147:setWidth(30);
    obj.edit147:setHorzTextAlign("center");
    obj.edit147:setName("edit147");

    obj.label89 = GUI.fromHandle(_obj_newObject("label"));
    obj.label89:setParent(obj.layout82);
    obj.label89:setField("C_FEI_Total");
    obj.label89:setAlign("left");
    obj.label89:setMargins({left = 5});
    obj.label89:setWidth(30);
    obj.label89:setHorzTextAlign("center");
    obj.label89:setName("label89");

    obj.layout83 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout83:setParent(obj.layout74);
    obj.layout83:setHeight(30);
    obj.layout83:setAlign("top");
    obj.layout83:setMargins({top=3});
    obj.layout83:setName("layout83");

    obj.rectangle68 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle68:setParent(obj.layout83);
    obj.rectangle68:setColor("black");
    obj.rectangle68:setAlign("left");
    obj.rectangle68:setWidth(120);
    obj.rectangle68:setName("rectangle68");

    obj.Herbologia = GUI.fromHandle(_obj_newObject("label"));
    obj.Herbologia:setParent(obj.rectangle68);
    obj.Herbologia:setName("Herbologia");
    obj.Herbologia:setText("Herbologia");
    obj.Herbologia:setTop(5);
    obj.Herbologia:setHorzTextAlign("center");

    obj.edit148 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit148:setParent(obj.layout83);
    obj.edit148:setField("INTE");
    obj.edit148:setAlign("left");
    obj.edit148:setMargins({left = 5});
    obj.edit148:setWidth(30);
    obj.edit148:setHorzTextAlign("center");
    obj.edit148:setReadOnly(true);
    obj.edit148:setName("edit148");

    obj.edit149 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit149:setParent(obj.layout83);
    obj.edit149:setField("C_HER_Grad");
    obj.edit149:setAlign("left");
    obj.edit149:setMargins({left = 5});
    obj.edit149:setWidth(30);
    obj.edit149:setHorzTextAlign("center");
    obj.edit149:setName("edit149");

    obj.edit150 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit150:setParent(obj.layout83);
    obj.edit150:setField("C_HER_Out");
    obj.edit150:setAlign("left");
    obj.edit150:setMargins({left = 5});
    obj.edit150:setWidth(30);
    obj.edit150:setHorzTextAlign("center");
    obj.edit150:setName("edit150");

    obj.label90 = GUI.fromHandle(_obj_newObject("label"));
    obj.label90:setParent(obj.layout83);
    obj.label90:setField("C_HER_Total");
    obj.label90:setAlign("left");
    obj.label90:setMargins({left = 5});
    obj.label90:setWidth(30);
    obj.label90:setHorzTextAlign("center");
    obj.label90:setName("label90");

    obj.layout84 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout84:setParent(obj.layout74);
    obj.layout84:setHeight(30);
    obj.layout84:setAlign("top");
    obj.layout84:setMargins({top=3});
    obj.layout84:setName("layout84");

    obj.rectangle69 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle69:setParent(obj.layout84);
    obj.rectangle69:setColor("black");
    obj.rectangle69:setAlign("left");
    obj.rectangle69:setWidth(120);
    obj.rectangle69:setName("rectangle69");

    obj.DCAT = GUI.fromHandle(_obj_newObject("label"));
    obj.DCAT:setParent(obj.rectangle69);
    obj.DCAT:setName("DCAT");
    obj.DCAT:setText("Maldições (DCAT)");
    obj.DCAT:setTop(5);
    obj.DCAT:setHorzTextAlign("center");

    obj.edit151 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit151:setParent(obj.layout84);
    obj.edit151:setField("INTE");
    obj.edit151:setAlign("left");
    obj.edit151:setMargins({left = 5});
    obj.edit151:setWidth(30);
    obj.edit151:setHorzTextAlign("center");
    obj.edit151:setReadOnly(true);
    obj.edit151:setName("edit151");

    obj.edit152 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit152:setParent(obj.layout84);
    obj.edit152:setField("C_MAL_Grad");
    obj.edit152:setAlign("left");
    obj.edit152:setMargins({left = 5});
    obj.edit152:setWidth(30);
    obj.edit152:setHorzTextAlign("center");
    obj.edit152:setName("edit152");

    obj.edit153 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit153:setParent(obj.layout84);
    obj.edit153:setField("C_MAL_Out");
    obj.edit153:setAlign("left");
    obj.edit153:setMargins({left = 5});
    obj.edit153:setWidth(30);
    obj.edit153:setHorzTextAlign("center");
    obj.edit153:setName("edit153");

    obj.label91 = GUI.fromHandle(_obj_newObject("label"));
    obj.label91:setParent(obj.layout84);
    obj.label91:setField("C_MAL_Total");
    obj.label91:setAlign("left");
    obj.label91:setMargins({left = 5});
    obj.label91:setWidth(30);
    obj.label91:setHorzTextAlign("center");
    obj.label91:setName("label91");

    obj.layout85 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout85:setParent(obj.layout74);
    obj.layout85:setHeight(30);
    obj.layout85:setAlign("top");
    obj.layout85:setMargins({top=3});
    obj.layout85:setName("layout85");

    obj.rectangle70 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle70:setParent(obj.layout85);
    obj.rectangle70:setColor("black");
    obj.rectangle70:setAlign("left");
    obj.rectangle70:setWidth(120);
    obj.rectangle70:setName("rectangle70");

    obj.Pocoes = GUI.fromHandle(_obj_newObject("label"));
    obj.Pocoes:setParent(obj.rectangle70);
    obj.Pocoes:setName("Pocoes");
    obj.Pocoes:setText("Poções");
    obj.Pocoes:setTop(5);
    obj.Pocoes:setHorzTextAlign("center");

    obj.edit154 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit154:setParent(obj.layout85);
    obj.edit154:setField("INTE");
    obj.edit154:setAlign("left");
    obj.edit154:setMargins({left = 5});
    obj.edit154:setWidth(30);
    obj.edit154:setHorzTextAlign("center");
    obj.edit154:setReadOnly(true);
    obj.edit154:setName("edit154");

    obj.edit155 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit155:setParent(obj.layout85);
    obj.edit155:setField("C_POC_Grad");
    obj.edit155:setAlign("left");
    obj.edit155:setMargins({left = 5});
    obj.edit155:setWidth(30);
    obj.edit155:setHorzTextAlign("center");
    obj.edit155:setName("edit155");

    obj.edit156 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit156:setParent(obj.layout85);
    obj.edit156:setField("C_POC_Out");
    obj.edit156:setAlign("left");
    obj.edit156:setMargins({left = 5});
    obj.edit156:setWidth(30);
    obj.edit156:setHorzTextAlign("center");
    obj.edit156:setName("edit156");

    obj.label92 = GUI.fromHandle(_obj_newObject("label"));
    obj.label92:setParent(obj.layout85);
    obj.label92:setField("C_POC_Total");
    obj.label92:setAlign("left");
    obj.label92:setMargins({left = 5});
    obj.label92:setWidth(30);
    obj.label92:setHorzTextAlign("center");
    obj.label92:setName("label92");

    obj.layout86 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout86:setParent(obj.layout74);
    obj.layout86:setHeight(30);
    obj.layout86:setAlign("top");
    obj.layout86:setMargins({top=3});
    obj.layout86:setName("layout86");

    obj.rectangle71 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle71:setParent(obj.layout86);
    obj.rectangle71:setColor("black");
    obj.rectangle71:setAlign("left");
    obj.rectangle71:setWidth(120);
    obj.rectangle71:setName("rectangle71");

    obj.Runas = GUI.fromHandle(_obj_newObject("label"));
    obj.Runas:setParent(obj.rectangle71);
    obj.Runas:setName("Runas");
    obj.Runas:setText("Runas");
    obj.Runas:setTop(5);
    obj.Runas:setHorzTextAlign("center");

    obj.edit157 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit157:setParent(obj.layout86);
    obj.edit157:setField("INTE");
    obj.edit157:setAlign("left");
    obj.edit157:setMargins({left = 5});
    obj.edit157:setWidth(30);
    obj.edit157:setHorzTextAlign("center");
    obj.edit157:setReadOnly(true);
    obj.edit157:setName("edit157");

    obj.edit158 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit158:setParent(obj.layout86);
    obj.edit158:setField("C_RUN_Grad");
    obj.edit158:setAlign("left");
    obj.edit158:setMargins({left = 5});
    obj.edit158:setWidth(30);
    obj.edit158:setHorzTextAlign("center");
    obj.edit158:setName("edit158");

    obj.edit159 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit159:setParent(obj.layout86);
    obj.edit159:setField("C_RUN_Out");
    obj.edit159:setAlign("left");
    obj.edit159:setMargins({left = 5});
    obj.edit159:setWidth(30);
    obj.edit159:setHorzTextAlign("center");
    obj.edit159:setName("edit159");

    obj.label93 = GUI.fromHandle(_obj_newObject("label"));
    obj.label93:setParent(obj.layout86);
    obj.label93:setField("C_RUN_Total");
    obj.label93:setAlign("left");
    obj.label93:setMargins({left = 5});
    obj.label93:setWidth(30);
    obj.label93:setHorzTextAlign("center");
    obj.label93:setName("label93");

    obj.layout87 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout87:setParent(obj.layout74);
    obj.layout87:setHeight(30);
    obj.layout87:setAlign("top");
    obj.layout87:setMargins({top=3});
    obj.layout87:setName("layout87");

    obj.rectangle72 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle72:setParent(obj.layout87);
    obj.rectangle72:setColor("black");
    obj.rectangle72:setAlign("left");
    obj.rectangle72:setWidth(120);
    obj.rectangle72:setName("rectangle72");

    obj.Transmutacao = GUI.fromHandle(_obj_newObject("label"));
    obj.Transmutacao:setParent(obj.rectangle72);
    obj.Transmutacao:setName("Transmutacao");
    obj.Transmutacao:setText("Transmutação");
    obj.Transmutacao:setTop(5);
    obj.Transmutacao:setHorzTextAlign("center");

    obj.edit160 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit160:setParent(obj.layout87);
    obj.edit160:setField("INTE");
    obj.edit160:setAlign("left");
    obj.edit160:setMargins({left = 5});
    obj.edit160:setWidth(30);
    obj.edit160:setHorzTextAlign("center");
    obj.edit160:setReadOnly(true);
    obj.edit160:setName("edit160");

    obj.edit161 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit161:setParent(obj.layout87);
    obj.edit161:setField("C_TRA_Grad");
    obj.edit161:setAlign("left");
    obj.edit161:setMargins({left = 5});
    obj.edit161:setWidth(30);
    obj.edit161:setHorzTextAlign("center");
    obj.edit161:setName("edit161");

    obj.edit162 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit162:setParent(obj.layout87);
    obj.edit162:setField("C_TRA_Out");
    obj.edit162:setAlign("left");
    obj.edit162:setMargins({left = 5});
    obj.edit162:setWidth(30);
    obj.edit162:setHorzTextAlign("center");
    obj.edit162:setName("edit162");

    obj.label94 = GUI.fromHandle(_obj_newObject("label"));
    obj.label94:setParent(obj.layout87);
    obj.label94:setField("C_TRA_Total");
    obj.label94:setAlign("left");
    obj.label94:setMargins({left = 5});
    obj.label94:setWidth(30);
    obj.label94:setHorzTextAlign("center");
    obj.label94:setName("label94");

    obj.tab6 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab6:setParent(obj.tabControl2);
    obj.tab6:setTitle("Outros");
    obj.tab6:setName("tab6");

    obj.layout88 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout88:setParent(obj.tab6);
    obj.layout88:setHeight(400);
    obj.layout88:setAlign("top");
    obj.layout88:setPadding({left=10, right=10});
    obj.layout88:setName("layout88");

    obj.label95 = GUI.fromHandle(_obj_newObject("label"));
    obj.label95:setParent(obj.layout88);
    obj.label95:setAlign("top");
    obj.label95:setHeight(50);
    obj.label95:setText("Outros");
    obj.label95:setHorzTextAlign("center");
    obj.label95:setFontSize(20);
    obj.label95:setName("label95");

    obj.button28 = GUI.fromHandle(_obj_newObject("button"));
    obj.button28:setParent(obj.layout88);
    obj.button28:setAlign("top");
    obj.button28:setHeight(25);
    obj.button28:setText("Nova Pericia");
    obj.button28:setWidth(80);
    obj.button28:setName("button28");

    obj.layout89 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout89:setParent(obj.layout88);
    obj.layout89:setHeight(30);
    obj.layout89:setAlign("top");
    obj.layout89:setMargins({top=3, left=35});
    obj.layout89:setName("layout89");

    obj.label96 = GUI.fromHandle(_obj_newObject("label"));
    obj.label96:setParent(obj.layout89);
    obj.label96:setText("Pericias");
    obj.label96:setTop(5);
    obj.label96:setHorzTextAlign("center");
    obj.label96:setAlign("left");
    obj.label96:setName("label96");

    obj.label97 = GUI.fromHandle(_obj_newObject("label"));
    obj.label97:setParent(obj.layout89);
    obj.label97:setText("Atr");
    obj.label97:setAlign("left");
    obj.label97:setMargins({left = 5});
    obj.label97:setWidth(30);
    obj.label97:setHorzTextAlign("center");
    obj.label97:setName("label97");

    obj.label98 = GUI.fromHandle(_obj_newObject("label"));
    obj.label98:setParent(obj.layout89);
    obj.label98:setText("Grad");
    obj.label98:setAlign("left");
    obj.label98:setMargins({left = 5});
    obj.label98:setWidth(30);
    obj.label98:setHorzTextAlign("center");
    obj.label98:setName("label98");

    obj.label99 = GUI.fromHandle(_obj_newObject("label"));
    obj.label99:setParent(obj.layout89);
    obj.label99:setText("Out");
    obj.label99:setAlign("left");
    obj.label99:setMargins({left = 5});
    obj.label99:setWidth(30);
    obj.label99:setHorzTextAlign("center");
    obj.label99:setName("label99");

    obj.label100 = GUI.fromHandle(_obj_newObject("label"));
    obj.label100:setParent(obj.layout89);
    obj.label100:setText("Total");
    obj.label100:setAlign("left");
    obj.label100:setMargins({left = 5});
    obj.label100:setWidth(30);
    obj.label100:setHorzTextAlign("center");
    obj.label100:setName("label100");

    obj.outrasPericias_record = GUI.fromHandle(_obj_newObject("recordList"));
    obj.outrasPericias_record:setParent(obj.layout88);
    obj.outrasPericias_record:setName("outrasPericias_record");
    obj.outrasPericias_record:setField("outrasPericias");
    obj.outrasPericias_record:setTemplateForm("outrasPericias");
    obj.outrasPericias_record:setAlign("top");
    obj.outrasPericias_record:setAutoHeight(true);

    obj.tabControl3 = GUI.fromHandle(_obj_newObject("tabControl"));
    obj.tabControl3:setParent(obj.layout55);
    obj.tabControl3:setAlign("left");
    obj.tabControl3:setWidth(300);
    obj.tabControl3:setName("tabControl3");

    obj.tab7 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab7:setParent(obj.tabControl3);
    obj.tab7:setTitle("Defesas");
    obj.tab7:setWidth(220);
    obj.tab7:setName("tab7");

    obj.layout90 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout90:setParent(obj.tab7);
    obj.layout90:setHeight(320);
    obj.layout90:setMargins({left=20});
    obj.layout90:setAlign("top");
    obj.layout90:setName("layout90");

    obj.label101 = GUI.fromHandle(_obj_newObject("label"));
    obj.label101:setParent(obj.layout90);
    obj.label101:setAlign("top");
    obj.label101:setHeight(50);
    obj.label101:setText("Defesas");
    obj.label101:setHorzTextAlign("center");
    obj.label101:setFontSize(20);
    obj.label101:setName("label101");

    obj.layout91 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout91:setParent(obj.layout90);
    obj.layout91:setHeight(30);
    obj.layout91:setAlign("top");
    obj.layout91:setMargins({top=3});
    obj.layout91:setName("layout91");

    obj.label102 = GUI.fromHandle(_obj_newObject("label"));
    obj.label102:setParent(obj.layout91);
    obj.label102:setText("Pericias");
    obj.label102:setTop(5);
    obj.label102:setHorzTextAlign("center");
    obj.label102:setAlign("left");
    obj.label102:setName("label102");

    obj.label103 = GUI.fromHandle(_obj_newObject("label"));
    obj.label103:setParent(obj.layout91);
    obj.label103:setText("Atr");
    obj.label103:setAlign("left");
    obj.label103:setMargins({left = 5});
    obj.label103:setWidth(30);
    obj.label103:setHorzTextAlign("center");
    obj.label103:setName("label103");

    obj.label104 = GUI.fromHandle(_obj_newObject("label"));
    obj.label104:setParent(obj.layout91);
    obj.label104:setText("Grad");
    obj.label104:setAlign("left");
    obj.label104:setMargins({left = 5});
    obj.label104:setWidth(30);
    obj.label104:setHorzTextAlign("center");
    obj.label104:setName("label104");

    obj.label105 = GUI.fromHandle(_obj_newObject("label"));
    obj.label105:setParent(obj.layout91);
    obj.label105:setText("Out");
    obj.label105:setAlign("left");
    obj.label105:setMargins({left = 5});
    obj.label105:setWidth(30);
    obj.label105:setHorzTextAlign("center");
    obj.label105:setName("label105");

    obj.label106 = GUI.fromHandle(_obj_newObject("label"));
    obj.label106:setParent(obj.layout91);
    obj.label106:setText("Total");
    obj.label106:setAlign("left");
    obj.label106:setMargins({left = 5});
    obj.label106:setWidth(30);
    obj.label106:setHorzTextAlign("center");
    obj.label106:setName("label106");

    obj.layout92 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout92:setParent(obj.layout90);
    obj.layout92:setHeight(30);
    obj.layout92:setAlign("top");
    obj.layout92:setMargins({top=3});
    obj.layout92:setName("layout92");

    obj.rectangle73 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle73:setParent(obj.layout92);
    obj.rectangle73:setColor("black");
    obj.rectangle73:setAlign("left");
    obj.rectangle73:setWidth(120);
    obj.rectangle73:setName("rectangle73");

    obj.Iniciativa = GUI.fromHandle(_obj_newObject("label"));
    obj.Iniciativa:setParent(obj.rectangle73);
    obj.Iniciativa:setName("Iniciativa");
    obj.Iniciativa:setText("Iniciativa");
    obj.Iniciativa:setTop(5);
    obj.Iniciativa:setHorzTextAlign("center");

    obj.edit163 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit163:setParent(obj.layout92);
    obj.edit163:setField("AGI");
    obj.edit163:setAlign("left");
    obj.edit163:setMargins({left = 5});
    obj.edit163:setWidth(30);
    obj.edit163:setHorzTextAlign("center");
    obj.edit163:setReadOnly(true);
    obj.edit163:setName("edit163");

    obj.edit164 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit164:setParent(obj.layout92);
    obj.edit164:setField("INI_Grad");
    obj.edit164:setAlign("left");
    obj.edit164:setMargins({left = 5});
    obj.edit164:setWidth(30);
    obj.edit164:setHorzTextAlign("center");
    obj.edit164:setName("edit164");

    obj.edit165 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit165:setParent(obj.layout92);
    obj.edit165:setField("INI_Out");
    obj.edit165:setAlign("left");
    obj.edit165:setMargins({left = 5});
    obj.edit165:setWidth(30);
    obj.edit165:setHorzTextAlign("center");
    obj.edit165:setName("edit165");

    obj.label107 = GUI.fromHandle(_obj_newObject("label"));
    obj.label107:setParent(obj.layout92);
    obj.label107:setField("INI_Total");
    obj.label107:setAlign("left");
    obj.label107:setMargins({left = 5});
    obj.label107:setWidth(30);
    obj.label107:setHorzTextAlign("center");
    obj.label107:setName("label107");

    obj.layout93 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout93:setParent(obj.layout90);
    obj.layout93:setHeight(30);
    obj.layout93:setAlign("top");
    obj.layout93:setMargins({top=3});
    obj.layout93:setName("layout93");

    obj.rectangle74 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle74:setParent(obj.layout93);
    obj.rectangle74:setColor("black");
    obj.rectangle74:setAlign("left");
    obj.rectangle74:setWidth(120);
    obj.rectangle74:setName("rectangle74");

    obj.Aparar = GUI.fromHandle(_obj_newObject("label"));
    obj.Aparar:setParent(obj.rectangle74);
    obj.Aparar:setName("Aparar");
    obj.Aparar:setText("Aparar");
    obj.Aparar:setTop(5);
    obj.Aparar:setHorzTextAlign("center");

    obj.edit166 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit166:setParent(obj.layout93);
    obj.edit166:setField("LUT");
    obj.edit166:setAlign("left");
    obj.edit166:setMargins({left = 5});
    obj.edit166:setWidth(30);
    obj.edit166:setHorzTextAlign("center");
    obj.edit166:setReadOnly(true);
    obj.edit166:setName("edit166");

    obj.edit167 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit167:setParent(obj.layout93);
    obj.edit167:setField("APA_Grad");
    obj.edit167:setAlign("left");
    obj.edit167:setMargins({left = 5});
    obj.edit167:setWidth(30);
    obj.edit167:setHorzTextAlign("center");
    obj.edit167:setName("edit167");

    obj.edit168 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit168:setParent(obj.layout93);
    obj.edit168:setField("APA_Out");
    obj.edit168:setAlign("left");
    obj.edit168:setMargins({left = 5});
    obj.edit168:setWidth(30);
    obj.edit168:setHorzTextAlign("center");
    obj.edit168:setName("edit168");

    obj.label108 = GUI.fromHandle(_obj_newObject("label"));
    obj.label108:setParent(obj.layout93);
    obj.label108:setField("APA_Total");
    obj.label108:setAlign("left");
    obj.label108:setMargins({left = 5});
    obj.label108:setWidth(30);
    obj.label108:setHorzTextAlign("center");
    obj.label108:setName("label108");

    obj.layout94 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout94:setParent(obj.layout90);
    obj.layout94:setHeight(30);
    obj.layout94:setAlign("top");
    obj.layout94:setMargins({top=3});
    obj.layout94:setName("layout94");

    obj.rectangle75 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle75:setParent(obj.layout94);
    obj.rectangle75:setColor("black");
    obj.rectangle75:setAlign("left");
    obj.rectangle75:setWidth(120);
    obj.rectangle75:setName("rectangle75");

    obj.Fortitude = GUI.fromHandle(_obj_newObject("label"));
    obj.Fortitude:setParent(obj.rectangle75);
    obj.Fortitude:setName("Fortitude");
    obj.Fortitude:setText("Fortitude");
    obj.Fortitude:setTop(5);
    obj.Fortitude:setHorzTextAlign("center");

    obj.edit169 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit169:setParent(obj.layout94);
    obj.edit169:setField("VIG");
    obj.edit169:setAlign("left");
    obj.edit169:setMargins({left = 5});
    obj.edit169:setWidth(30);
    obj.edit169:setHorzTextAlign("center");
    obj.edit169:setReadOnly(true);
    obj.edit169:setName("edit169");

    obj.edit170 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit170:setParent(obj.layout94);
    obj.edit170:setField("FORT_Grad");
    obj.edit170:setAlign("left");
    obj.edit170:setMargins({left = 5});
    obj.edit170:setWidth(30);
    obj.edit170:setHorzTextAlign("center");
    obj.edit170:setName("edit170");

    obj.edit171 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit171:setParent(obj.layout94);
    obj.edit171:setField("FORT_Out");
    obj.edit171:setAlign("left");
    obj.edit171:setMargins({left = 5});
    obj.edit171:setWidth(30);
    obj.edit171:setHorzTextAlign("center");
    obj.edit171:setName("edit171");

    obj.label109 = GUI.fromHandle(_obj_newObject("label"));
    obj.label109:setParent(obj.layout94);
    obj.label109:setField("FORT_Total");
    obj.label109:setAlign("left");
    obj.label109:setMargins({left = 5});
    obj.label109:setWidth(30);
    obj.label109:setHorzTextAlign("center");
    obj.label109:setName("label109");

    obj.layout95 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout95:setParent(obj.layout90);
    obj.layout95:setHeight(30);
    obj.layout95:setAlign("top");
    obj.layout95:setMargins({top=3});
    obj.layout95:setName("layout95");

    obj.rectangle76 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle76:setParent(obj.layout95);
    obj.rectangle76:setColor("black");
    obj.rectangle76:setAlign("left");
    obj.rectangle76:setWidth(120);
    obj.rectangle76:setName("rectangle76");

    obj.Reflexo = GUI.fromHandle(_obj_newObject("label"));
    obj.Reflexo:setParent(obj.rectangle76);
    obj.Reflexo:setName("Reflexo");
    obj.Reflexo:setText("Reflexo");
    obj.Reflexo:setTop(5);
    obj.Reflexo:setHorzTextAlign("center");

    obj.edit172 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit172:setParent(obj.layout95);
    obj.edit172:setField("AGI");
    obj.edit172:setAlign("left");
    obj.edit172:setMargins({left = 5});
    obj.edit172:setWidth(30);
    obj.edit172:setHorzTextAlign("center");
    obj.edit172:setReadOnly(true);
    obj.edit172:setName("edit172");

    obj.edit173 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit173:setParent(obj.layout95);
    obj.edit173:setField("REF_Grad");
    obj.edit173:setAlign("left");
    obj.edit173:setMargins({left = 5});
    obj.edit173:setWidth(30);
    obj.edit173:setHorzTextAlign("center");
    obj.edit173:setName("edit173");

    obj.edit174 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit174:setParent(obj.layout95);
    obj.edit174:setField("REF_Out");
    obj.edit174:setAlign("left");
    obj.edit174:setMargins({left = 5});
    obj.edit174:setWidth(30);
    obj.edit174:setHorzTextAlign("center");
    obj.edit174:setName("edit174");

    obj.label110 = GUI.fromHandle(_obj_newObject("label"));
    obj.label110:setParent(obj.layout95);
    obj.label110:setField("REF_Total");
    obj.label110:setAlign("left");
    obj.label110:setMargins({left = 5});
    obj.label110:setWidth(30);
    obj.label110:setHorzTextAlign("center");
    obj.label110:setName("label110");

    obj.layout96 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout96:setParent(obj.layout90);
    obj.layout96:setHeight(30);
    obj.layout96:setAlign("top");
    obj.layout96:setMargins({top=3});
    obj.layout96:setName("layout96");

    obj.rectangle77 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle77:setParent(obj.layout96);
    obj.rectangle77:setColor("black");
    obj.rectangle77:setAlign("left");
    obj.rectangle77:setWidth(120);
    obj.rectangle77:setName("rectangle77");

    obj.Resistencia = GUI.fromHandle(_obj_newObject("label"));
    obj.Resistencia:setParent(obj.rectangle77);
    obj.Resistencia:setName("Resistencia");
    obj.Resistencia:setText("Resistencia");
    obj.Resistencia:setTop(5);
    obj.Resistencia:setHorzTextAlign("center");

    obj.edit175 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit175:setParent(obj.layout96);
    obj.edit175:setField("VIG");
    obj.edit175:setAlign("left");
    obj.edit175:setMargins({left = 5});
    obj.edit175:setWidth(30);
    obj.edit175:setHorzTextAlign("center");
    obj.edit175:setReadOnly(true);
    obj.edit175:setName("edit175");

    obj.edit176 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit176:setParent(obj.layout96);
    obj.edit176:setField("RES_Grad");
    obj.edit176:setAlign("left");
    obj.edit176:setMargins({left = 5});
    obj.edit176:setWidth(30);
    obj.edit176:setHorzTextAlign("center");
    obj.edit176:setName("edit176");

    obj.edit177 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit177:setParent(obj.layout96);
    obj.edit177:setField("RES_Out");
    obj.edit177:setAlign("left");
    obj.edit177:setMargins({left = 5});
    obj.edit177:setWidth(30);
    obj.edit177:setHorzTextAlign("center");
    obj.edit177:setName("edit177");

    obj.label111 = GUI.fromHandle(_obj_newObject("label"));
    obj.label111:setParent(obj.layout96);
    obj.label111:setField("RES_Total");
    obj.label111:setAlign("left");
    obj.label111:setMargins({left = 5});
    obj.label111:setWidth(30);
    obj.label111:setHorzTextAlign("center");
    obj.label111:setName("label111");

    obj.layout97 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout97:setParent(obj.layout90);
    obj.layout97:setHeight(30);
    obj.layout97:setAlign("top");
    obj.layout97:setMargins({top=3});
    obj.layout97:setName("layout97");

    obj.rectangle78 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle78:setParent(obj.layout97);
    obj.rectangle78:setColor("black");
    obj.rectangle78:setAlign("left");
    obj.rectangle78:setWidth(120);
    obj.rectangle78:setName("rectangle78");

    obj.Vontade = GUI.fromHandle(_obj_newObject("label"));
    obj.Vontade:setParent(obj.rectangle78);
    obj.Vontade:setName("Vontade");
    obj.Vontade:setText("Vontade");
    obj.Vontade:setTop(5);
    obj.Vontade:setHorzTextAlign("center");

    obj.edit178 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit178:setParent(obj.layout97);
    obj.edit178:setField("SAB");
    obj.edit178:setAlign("left");
    obj.edit178:setMargins({left = 5});
    obj.edit178:setWidth(30);
    obj.edit178:setHorzTextAlign("center");
    obj.edit178:setReadOnly(true);
    obj.edit178:setName("edit178");

    obj.edit179 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit179:setParent(obj.layout97);
    obj.edit179:setField("VON_Grad");
    obj.edit179:setAlign("left");
    obj.edit179:setMargins({left = 5});
    obj.edit179:setWidth(30);
    obj.edit179:setHorzTextAlign("center");
    obj.edit179:setName("edit179");

    obj.edit180 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit180:setParent(obj.layout97);
    obj.edit180:setField("VON_Out");
    obj.edit180:setAlign("left");
    obj.edit180:setMargins({left = 5});
    obj.edit180:setWidth(30);
    obj.edit180:setHorzTextAlign("center");
    obj.edit180:setName("edit180");

    obj.label112 = GUI.fromHandle(_obj_newObject("label"));
    obj.label112:setParent(obj.layout97);
    obj.label112:setField("VON_Total");
    obj.label112:setAlign("left");
    obj.label112:setMargins({left = 5});
    obj.label112:setWidth(30);
    obj.label112:setHorzTextAlign("center");
    obj.label112:setName("label112");

    obj.tab8 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab8:setParent(obj.tabControl3);
    obj.tab8:setTitle("Tarefas");
    obj.tab8:setWidth(220);
    obj.tab8:setName("tab8");

    obj.scrollBox3 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox3:setParent(obj.tab8);
    obj.scrollBox3:setHeight(600);
    obj.scrollBox3:setAlign("top");
    obj.scrollBox3:setName("scrollBox3");

    obj.button29 = GUI.fromHandle(_obj_newObject("button"));
    obj.button29:setParent(obj.scrollBox3);
    obj.button29:setLeft(20);
    obj.button29:setTop(20);
    obj.button29:setHeight(25);
    obj.button29:setText("Nova Tarefa");
    obj.button29:setWidth(80);
    obj.button29:setName("button29");

    obj.kekzin = GUI.fromHandle(_obj_newObject("recordList"));
    obj.kekzin:setParent(obj.scrollBox3);
    obj.kekzin:setName("kekzin");
    obj.kekzin:setField("tarefasRecordList");
    obj.kekzin:setTemplateForm("frmItemDeMagia");
    obj.kekzin:setLeft(0);
    obj.kekzin:setTop(60);
    obj.kekzin:setWidth(300);
    obj.kekzin:setAutoHeight(true);

    obj.tab9 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab9:setParent(obj.tabControl3);
    obj.tab9:setTitle("Treinar");
    obj.tab9:setWidth(220);
    obj.tab9:setName("tab9");



        local function rolarCorpo()

        local mesaDoPersonagem = rrpg.getMesaDe(sheet);
        local chat = mesaDoPersonagem.chat
        local node = NDB.getRoot(sheet)

        chat:rolarDados("1d20 + " .. (sheet.VIG or 0), "Treinamento Corpo: CD " .. (sheet.treinoCD or 0) +
        (node.fisico or 0))
        end

        local function rolarMente()

        local node = NDB.getRoot(sheet)
        local mesaDoPersonagem = rrpg.getMesaDe(sheet);
        local chat = mesaDoPersonagem.chat

        chat:rolarDados("1d20 + " .. (sheet.INTE or 0), "Treinamento Mente: CD " .. (sheet.treinoCD or 0) +
        (node.mental or 0))
        end

        local function ListaDeFeiticoParaTreino()
        require("utils.lua");

        local Raiz = NDB.load("listfetico.xml");
        local Filho = NDB.getChildNodes(Raiz);

        ListaFeiticos = {} -- new array
        ListaNomesFeitico = {} -- new array

        for i = 1, #Filho, 1 do
        ListaFeiticos[i] = Raiz["f" .. i]
        ListaNomesFeitico[i] = Raiz["f" .. i].nome
        end

        table.sort(ListaNomesFeitico)

        Dialogs.choose("Selecione uma das opções", ListaNomesFeitico,
        function(selected, selectedIndex, selectedText)

        if selected then

        for k = 1, #Filho, 1 do

        if tostring(selectedText) == ListaFeiticos[k].nome then

        sheet.treinoCD = math.floor(totable(ListaFeiticos[k].cdfArray)[1] / 2 + 5)

        end

        end

        else

        end;

        end)


        end

    


    obj.layout98 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout98:setParent(obj.tab9);
    obj.layout98:setHeight(320);
    obj.layout98:setAlign("top");
    obj.layout98:setName("layout98");

    obj.button30 = GUI.fromHandle(_obj_newObject("button"));
    obj.button30:setParent(obj.layout98);
    obj.button30:setText("Feitiços...");
    obj.button30:setAlign("top");
    obj.button30:setHeight(30);
    obj.button30:setMargins({left = 5, top = 10, right = 5});
    obj.button30:setHorzTextAlign("center");
    obj.button30:setName("button30");

    obj.layout99 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout99:setParent(obj.layout98);
    obj.layout99:setAlign("top");
    obj.layout99:setHeight(50);
    obj.layout99:setMargins({top=20});
    obj.layout99:setPadding({left = 5, top = 15, right = 5});
    obj.layout99:setName("layout99");

    obj.label113 = GUI.fromHandle(_obj_newObject("label"));
    obj.label113:setParent(obj.layout99);
    obj.label113:setText("Dificuldade");
    obj.label113:setAlign("left");
    obj.label113:setMargins({left = 5, top = 5, right = 5});
    obj.label113:setHorzTextAlign("center");
    obj.label113:setName("label113");

    obj.edit181 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit181:setParent(obj.layout99);
    obj.edit181:setField("treinoCD");
    obj.edit181:setAlign("left");
    obj.edit181:setWidth(145);
    obj.edit181:setMargins({left = 5, top = 5, right = 5});
    obj.edit181:setHorzTextAlign("center");
    obj.edit181:setName("edit181");

    obj.label114 = GUI.fromHandle(_obj_newObject("label"));
    obj.label114:setParent(obj.layout98);
    obj.label114:setText("TREINAR:");
    obj.label114:setAlign("top");
    obj.label114:setHeight(40);
    obj.label114:setFontSize(18);
    obj.label114:setMargins({left = 5, top=5, right = 5});
    obj.label114:setHorzTextAlign("center");
    obj.label114:setName("label114");

    obj.button31 = GUI.fromHandle(_obj_newObject("button"));
    obj.button31:setParent(obj.layout98);
    obj.button31:setText("Corpo");
    obj.button31:setAlign("top");
    obj.button31:setHeight(30);
    obj.button31:setMargins({left = 5, right = 5});
    obj.button31:setHorzTextAlign("center");
    obj.button31:setName("button31");

    obj.button32 = GUI.fromHandle(_obj_newObject("button"));
    obj.button32:setParent(obj.layout98);
    obj.button32:setText("Mente");
    obj.button32:setAlign("top");
    obj.button32:setHeight(30);
    obj.button32:setMargins({left = 5, top = 15, right = 5});
    obj.button32:setHorzTextAlign("center");
    obj.button32:setName("button32");

    obj.tab10 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab10:setParent(obj.tabControl3);
    obj.tab10:setTitle("Quadribol");
    obj.tab10:setWidth(220);
    obj.tab10:setName("tab10");

    obj.layout100 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout100:setParent(obj.tab10);
    obj.layout100:setHeight(600);
    obj.layout100:setMargins({left=20});
    obj.layout100:setAlign("top");
    obj.layout100:setName("layout100");

    obj.label115 = GUI.fromHandle(_obj_newObject("label"));
    obj.label115:setParent(obj.layout100);
    obj.label115:setAlign("top");
    obj.label115:setHeight(50);
    obj.label115:setText("QUADRIBOL");
    obj.label115:setHorzTextAlign("center");
    obj.label115:setName("label115");

    obj.layout101 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout101:setParent(obj.layout100);
    obj.layout101:setHeight(30);
    obj.layout101:setAlign("top");
    obj.layout101:setName("layout101");

    obj.rectangle79 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle79:setParent(obj.layout101);
    obj.rectangle79:setColor("black");
    obj.rectangle79:setAlign("left");
    obj.rectangle79:setWidth(90);
    obj.rectangle79:setName("rectangle79");

    obj.label116 = GUI.fromHandle(_obj_newObject("label"));
    obj.label116:setParent(obj.rectangle79);
    obj.label116:setText("Golear");
    obj.label116:setWidth(90);
    obj.label116:setTop(5);
    obj.label116:setHorzTextAlign("center");
    obj.label116:setName("label116");

    obj.edit182 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit182:setParent(obj.layout101);
    obj.edit182:setField("GOL_MOD");
    obj.edit182:setAlign("left");
    obj.edit182:setMargins({left = 5});
    obj.edit182:setWidth(30);
    obj.edit182:setHorzTextAlign("center");
    obj.edit182:setReadOnly(true);
    obj.edit182:setName("edit182");

    obj.rectangle80 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle80:setParent(obj.layout101);
    obj.rectangle80:setColor("black");
    obj.rectangle80:setAlign("left");
    obj.rectangle80:setWidth(90);
    obj.rectangle80:setMargins({left = 10});
    obj.rectangle80:setName("rectangle80");

    obj.label117 = GUI.fromHandle(_obj_newObject("label"));
    obj.label117:setParent(obj.rectangle80);
    obj.label117:setText("Passe");
    obj.label117:setWidth(90);
    obj.label117:setTop(5);
    obj.label117:setHorzTextAlign("center");
    obj.label117:setName("label117");

    obj.edit183 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit183:setParent(obj.layout101);
    obj.edit183:setField("PAS_MOD");
    obj.edit183:setAlign("left");
    obj.edit183:setMargins({left = 5});
    obj.edit183:setWidth(30);
    obj.edit183:setHorzTextAlign("center");
    obj.edit183:setReadOnly(true);
    obj.edit183:setName("edit183");

    obj.layout102 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout102:setParent(obj.layout100);
    obj.layout102:setHeight(30);
    obj.layout102:setAlign("top");
    obj.layout102:setMargins({top=5});
    obj.layout102:setName("layout102");

    obj.rectangle81 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle81:setParent(obj.layout102);
    obj.rectangle81:setColor("black");
    obj.rectangle81:setAlign("left");
    obj.rectangle81:setWidth(90);
    obj.rectangle81:setName("rectangle81");

    obj.label118 = GUI.fromHandle(_obj_newObject("label"));
    obj.label118:setParent(obj.rectangle81);
    obj.label118:setText("Rebater");
    obj.label118:setWidth(90);
    obj.label118:setTop(5);
    obj.label118:setHorzTextAlign("center");
    obj.label118:setName("label118");

    obj.edit184 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit184:setParent(obj.layout102);
    obj.edit184:setField("REB_MOD");
    obj.edit184:setAlign("left");
    obj.edit184:setMargins({left = 5});
    obj.edit184:setWidth(30);
    obj.edit184:setHorzTextAlign("center");
    obj.edit184:setReadOnly(true);
    obj.edit184:setName("edit184");

    obj.rectangle82 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle82:setParent(obj.layout102);
    obj.rectangle82:setColor("black");
    obj.rectangle82:setAlign("left");
    obj.rectangle82:setWidth(90);
    obj.rectangle82:setMargins({left = 10});
    obj.rectangle82:setName("rectangle82");

    obj.label119 = GUI.fromHandle(_obj_newObject("label"));
    obj.label119:setParent(obj.rectangle82);
    obj.label119:setText("Velocidade");
    obj.label119:setWidth(90);
    obj.label119:setTop(5);
    obj.label119:setHorzTextAlign("center");
    obj.label119:setName("label119");

    obj.edit185 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit185:setParent(obj.layout102);
    obj.edit185:setField("VEL_MOD");
    obj.edit185:setAlign("left");
    obj.edit185:setMargins({left = 5});
    obj.edit185:setWidth(30);
    obj.edit185:setHorzTextAlign("center");
    obj.edit185:setReadOnly(true);
    obj.edit185:setName("edit185");

    obj.layout103 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout103:setParent(obj.layout100);
    obj.layout103:setHeight(30);
    obj.layout103:setAlign("top");
    obj.layout103:setMargins({top=3});
    obj.layout103:setName("layout103");

    obj.label120 = GUI.fromHandle(_obj_newObject("label"));
    obj.label120:setParent(obj.layout103);
    obj.label120:setText("Pericias");
    obj.label120:setTop(5);
    obj.label120:setHorzTextAlign("center");
    obj.label120:setAlign("left");
    obj.label120:setName("label120");

    obj.label121 = GUI.fromHandle(_obj_newObject("label"));
    obj.label121:setParent(obj.layout103);
    obj.label121:setText("Atr");
    obj.label121:setAlign("left");
    obj.label121:setMargins({left = 5});
    obj.label121:setWidth(30);
    obj.label121:setHorzTextAlign("center");
    obj.label121:setName("label121");

    obj.label122 = GUI.fromHandle(_obj_newObject("label"));
    obj.label122:setParent(obj.layout103);
    obj.label122:setText("Grad");
    obj.label122:setAlign("left");
    obj.label122:setMargins({left = 5});
    obj.label122:setWidth(30);
    obj.label122:setHorzTextAlign("center");
    obj.label122:setName("label122");

    obj.label123 = GUI.fromHandle(_obj_newObject("label"));
    obj.label123:setParent(obj.layout103);
    obj.label123:setText("Out");
    obj.label123:setAlign("left");
    obj.label123:setMargins({left = 5});
    obj.label123:setWidth(30);
    obj.label123:setHorzTextAlign("center");
    obj.label123:setName("label123");

    obj.label124 = GUI.fromHandle(_obj_newObject("label"));
    obj.label124:setParent(obj.layout103);
    obj.label124:setText("Total");
    obj.label124:setAlign("left");
    obj.label124:setMargins({left = 5});
    obj.label124:setWidth(30);
    obj.label124:setHorzTextAlign("center");
    obj.label124:setName("label124");

    obj.layout104 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout104:setParent(obj.layout100);
    obj.layout104:setHeight(30);
    obj.layout104:setAlign("top");
    obj.layout104:setMargins({top=3});
    obj.layout104:setName("layout104");

    obj.rectangle83 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle83:setParent(obj.layout104);
    obj.rectangle83:setColor("black");
    obj.rectangle83:setAlign("left");
    obj.rectangle83:setWidth(120);
    obj.rectangle83:setName("rectangle83");

    obj.ANTE_QUAD = GUI.fromHandle(_obj_newObject("label"));
    obj.ANTE_QUAD:setParent(obj.rectangle83);
    obj.ANTE_QUAD:setName("ANTE_QUAD");
    obj.ANTE_QUAD:setText("Antecipar");
    obj.ANTE_QUAD:setTop(5);
    obj.ANTE_QUAD:setHorzTextAlign("center");

    obj.edit186 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit186:setParent(obj.layout104);
    obj.edit186:setField("SAB");
    obj.edit186:setAlign("left");
    obj.edit186:setMargins({left = 5});
    obj.edit186:setWidth(30);
    obj.edit186:setHorzTextAlign("center");
    obj.edit186:setReadOnly(true);
    obj.edit186:setName("edit186");

    obj.edit187 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit187:setParent(obj.layout104);
    obj.edit187:setField("VEI_Grad");
    obj.edit187:setAlign("left");
    obj.edit187:setMargins({left = 5});
    obj.edit187:setWidth(30);
    obj.edit187:setHorzTextAlign("center");
    obj.edit187:setReadOnly(true);
    obj.edit187:setName("edit187");

    obj.edit188 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit188:setParent(obj.layout104);
    obj.edit188:setField("ANTE_QUAD_OUT");
    obj.edit188:setAlign("left");
    obj.edit188:setMargins({left = 5});
    obj.edit188:setWidth(30);
    obj.edit188:setHorzTextAlign("center");
    obj.edit188:setName("edit188");

    obj.label125 = GUI.fromHandle(_obj_newObject("label"));
    obj.label125:setParent(obj.layout104);
    obj.label125:setField("ANTE_QUAD_TOTAL");
    obj.label125:setAlign("left");
    obj.label125:setMargins({left = 5});
    obj.label125:setWidth(30);
    obj.label125:setHorzTextAlign("center");
    obj.label125:setName("label125");

    obj.layout105 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout105:setParent(obj.layout100);
    obj.layout105:setHeight(30);
    obj.layout105:setAlign("top");
    obj.layout105:setMargins({top=3});
    obj.layout105:setName("layout105");

    obj.rectangle84 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle84:setParent(obj.layout105);
    obj.rectangle84:setColor("black");
    obj.rectangle84:setAlign("left");
    obj.rectangle84:setWidth(120);
    obj.rectangle84:setName("rectangle84");

    obj.APAN_QUAD = GUI.fromHandle(_obj_newObject("label"));
    obj.APAN_QUAD:setParent(obj.rectangle84);
    obj.APAN_QUAD:setName("APAN_QUAD");
    obj.APAN_QUAD:setText("Apanhar Pomo");
    obj.APAN_QUAD:setTop(5);
    obj.APAN_QUAD:setHorzTextAlign("center");

    obj.edit189 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit189:setParent(obj.layout105);
    obj.edit189:setField("DES");
    obj.edit189:setAlign("left");
    obj.edit189:setMargins({left = 5});
    obj.edit189:setWidth(30);
    obj.edit189:setHorzTextAlign("center");
    obj.edit189:setReadOnly(true);
    obj.edit189:setName("edit189");

    obj.edit190 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit190:setParent(obj.layout105);
    obj.edit190:setField("VEI_Grad");
    obj.edit190:setAlign("left");
    obj.edit190:setMargins({left = 5});
    obj.edit190:setWidth(30);
    obj.edit190:setHorzTextAlign("center");
    obj.edit190:setReadOnly(true);
    obj.edit190:setName("edit190");

    obj.edit191 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit191:setParent(obj.layout105);
    obj.edit191:setField("APAN_QUAD_OUT");
    obj.edit191:setAlign("left");
    obj.edit191:setMargins({left = 5});
    obj.edit191:setWidth(30);
    obj.edit191:setHorzTextAlign("center");
    obj.edit191:setName("edit191");

    obj.label126 = GUI.fromHandle(_obj_newObject("label"));
    obj.label126:setParent(obj.layout105);
    obj.label126:setField("APAN_QUAD_TOTAL");
    obj.label126:setAlign("left");
    obj.label126:setMargins({left = 5});
    obj.label126:setWidth(30);
    obj.label126:setHorzTextAlign("center");
    obj.label126:setName("label126");

    obj.layout106 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout106:setParent(obj.layout100);
    obj.layout106:setHeight(30);
    obj.layout106:setAlign("top");
    obj.layout106:setMargins({top=3});
    obj.layout106:setName("layout106");

    obj.rectangle85 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle85:setParent(obj.layout106);
    obj.rectangle85:setColor("black");
    obj.rectangle85:setAlign("left");
    obj.rectangle85:setWidth(120);
    obj.rectangle85:setName("rectangle85");

    obj.ATRA_QUAD = GUI.fromHandle(_obj_newObject("label"));
    obj.ATRA_QUAD:setParent(obj.rectangle85);
    obj.ATRA_QUAD:setName("ATRA_QUAD");
    obj.ATRA_QUAD:setText("Atrapalhar");
    obj.ATRA_QUAD:setTop(5);
    obj.ATRA_QUAD:setHorzTextAlign("center");

    obj.edit192 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit192:setParent(obj.layout106);
    obj.edit192:setField("INTE");
    obj.edit192:setAlign("left");
    obj.edit192:setMargins({left = 5});
    obj.edit192:setWidth(30);
    obj.edit192:setHorzTextAlign("center");
    obj.edit192:setReadOnly(true);
    obj.edit192:setName("edit192");

    obj.edit193 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit193:setParent(obj.layout106);
    obj.edit193:setField("VEI_Grad");
    obj.edit193:setAlign("left");
    obj.edit193:setMargins({left = 5});
    obj.edit193:setWidth(30);
    obj.edit193:setHorzTextAlign("center");
    obj.edit193:setReadOnly(true);
    obj.edit193:setName("edit193");

    obj.edit194 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit194:setParent(obj.layout106);
    obj.edit194:setField("ATRA_QUAD_OUT");
    obj.edit194:setAlign("left");
    obj.edit194:setMargins({left = 5});
    obj.edit194:setWidth(30);
    obj.edit194:setHorzTextAlign("center");
    obj.edit194:setName("edit194");

    obj.label127 = GUI.fromHandle(_obj_newObject("label"));
    obj.label127:setParent(obj.layout106);
    obj.label127:setField("ATRA_QUAD_TOTAL");
    obj.label127:setAlign("left");
    obj.label127:setMargins({left = 5});
    obj.label127:setWidth(30);
    obj.label127:setHorzTextAlign("center");
    obj.label127:setName("label127");

    obj.layout107 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout107:setParent(obj.layout100);
    obj.layout107:setHeight(30);
    obj.layout107:setAlign("top");
    obj.layout107:setMargins({top=3});
    obj.layout107:setName("layout107");

    obj.rectangle86 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle86:setParent(obj.layout107);
    obj.rectangle86:setColor("black");
    obj.rectangle86:setAlign("left");
    obj.rectangle86:setWidth(120);
    obj.rectangle86:setName("rectangle86");

    obj.DEFE_QUAD = GUI.fromHandle(_obj_newObject("label"));
    obj.DEFE_QUAD:setParent(obj.rectangle86);
    obj.DEFE_QUAD:setName("DEFE_QUAD");
    obj.DEFE_QUAD:setText("Defender");
    obj.DEFE_QUAD:setTop(5);
    obj.DEFE_QUAD:setHorzTextAlign("center");

    obj.edit195 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit195:setParent(obj.layout107);
    obj.edit195:setField("AGI");
    obj.edit195:setAlign("left");
    obj.edit195:setMargins({left = 5});
    obj.edit195:setWidth(30);
    obj.edit195:setHorzTextAlign("center");
    obj.edit195:setReadOnly(true);
    obj.edit195:setName("edit195");

    obj.edit196 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit196:setParent(obj.layout107);
    obj.edit196:setField("VEI_Grad");
    obj.edit196:setAlign("left");
    obj.edit196:setMargins({left = 5});
    obj.edit196:setWidth(30);
    obj.edit196:setHorzTextAlign("center");
    obj.edit196:setReadOnly(true);
    obj.edit196:setName("edit196");

    obj.edit197 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit197:setParent(obj.layout107);
    obj.edit197:setField("DEFE_QUAD_OUT");
    obj.edit197:setAlign("left");
    obj.edit197:setMargins({left = 5});
    obj.edit197:setWidth(30);
    obj.edit197:setHorzTextAlign("center");
    obj.edit197:setName("edit197");

    obj.label128 = GUI.fromHandle(_obj_newObject("label"));
    obj.label128:setParent(obj.layout107);
    obj.label128:setField("DEFE_QUAD_TOTAL");
    obj.label128:setAlign("left");
    obj.label128:setMargins({left = 5});
    obj.label128:setWidth(30);
    obj.label128:setHorzTextAlign("center");
    obj.label128:setName("label128");

    obj.layout108 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout108:setParent(obj.layout100);
    obj.layout108:setHeight(30);
    obj.layout108:setAlign("top");
    obj.layout108:setMargins({top=3});
    obj.layout108:setName("layout108");

    obj.rectangle87 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle87:setParent(obj.layout108);
    obj.rectangle87:setColor("black");
    obj.rectangle87:setAlign("left");
    obj.rectangle87:setWidth(120);
    obj.rectangle87:setName("rectangle87");

    obj.DRI_QUAD = GUI.fromHandle(_obj_newObject("label"));
    obj.DRI_QUAD:setParent(obj.rectangle87);
    obj.DRI_QUAD:setName("DRI_QUAD");
    obj.DRI_QUAD:setText("Driblar");
    obj.DRI_QUAD:setTop(5);
    obj.DRI_QUAD:setHorzTextAlign("center");

    obj.edit198 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit198:setParent(obj.layout108);
    obj.edit198:setField("AGI");
    obj.edit198:setAlign("left");
    obj.edit198:setMargins({left = 5});
    obj.edit198:setWidth(30);
    obj.edit198:setHorzTextAlign("center");
    obj.edit198:setReadOnly(true);
    obj.edit198:setName("edit198");

    obj.edit199 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit199:setParent(obj.layout108);
    obj.edit199:setField("VEI_Grad");
    obj.edit199:setAlign("left");
    obj.edit199:setMargins({left = 5});
    obj.edit199:setWidth(30);
    obj.edit199:setHorzTextAlign("center");
    obj.edit199:setReadOnly(true);
    obj.edit199:setName("edit199");

    obj.edit200 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit200:setParent(obj.layout108);
    obj.edit200:setField("DRI_QUAD_OUT");
    obj.edit200:setAlign("left");
    obj.edit200:setMargins({left = 5});
    obj.edit200:setWidth(30);
    obj.edit200:setHorzTextAlign("center");
    obj.edit200:setName("edit200");

    obj.label129 = GUI.fromHandle(_obj_newObject("label"));
    obj.label129:setParent(obj.layout108);
    obj.label129:setField("DRI_QUAD_TOTAL");
    obj.label129:setAlign("left");
    obj.label129:setMargins({left = 5});
    obj.label129:setWidth(30);
    obj.label129:setHorzTextAlign("center");
    obj.label129:setName("label129");

    obj.layout109 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout109:setParent(obj.layout100);
    obj.layout109:setHeight(30);
    obj.layout109:setAlign("top");
    obj.layout109:setMargins({top=3});
    obj.layout109:setName("layout109");

    obj.rectangle88 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle88:setParent(obj.layout109);
    obj.rectangle88:setColor("black");
    obj.rectangle88:setAlign("left");
    obj.rectangle88:setWidth(120);
    obj.rectangle88:setName("rectangle88");

    obj.GOL_QUAD = GUI.fromHandle(_obj_newObject("label"));
    obj.GOL_QUAD:setParent(obj.rectangle88);
    obj.GOL_QUAD:setName("GOL_QUAD");
    obj.GOL_QUAD:setText("Golear");
    obj.GOL_QUAD:setTop(5);
    obj.GOL_QUAD:setHorzTextAlign("center");

    obj.edit201 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit201:setParent(obj.layout109);
    obj.edit201:setField("FOR");
    obj.edit201:setAlign("left");
    obj.edit201:setMargins({left = 5});
    obj.edit201:setWidth(30);
    obj.edit201:setHorzTextAlign("center");
    obj.edit201:setReadOnly(true);
    obj.edit201:setName("edit201");

    obj.edit202 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit202:setParent(obj.layout109);
    obj.edit202:setField("VEI_Grad");
    obj.edit202:setAlign("left");
    obj.edit202:setMargins({left = 5});
    obj.edit202:setWidth(30);
    obj.edit202:setHorzTextAlign("center");
    obj.edit202:setReadOnly(true);
    obj.edit202:setName("edit202");

    obj.edit203 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit203:setParent(obj.layout109);
    obj.edit203:setField("GOL_QUAD_OUT");
    obj.edit203:setAlign("left");
    obj.edit203:setMargins({left = 5});
    obj.edit203:setWidth(30);
    obj.edit203:setHorzTextAlign("center");
    obj.edit203:setName("edit203");

    obj.label130 = GUI.fromHandle(_obj_newObject("label"));
    obj.label130:setParent(obj.layout109);
    obj.label130:setField("GOL_QUAD_TOTAL");
    obj.label130:setAlign("left");
    obj.label130:setMargins({left = 5});
    obj.label130:setWidth(30);
    obj.label130:setHorzTextAlign("center");
    obj.label130:setName("label130");

    obj.layout110 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout110:setParent(obj.layout100);
    obj.layout110:setHeight(30);
    obj.layout110:setAlign("top");
    obj.layout110:setMargins({top=3});
    obj.layout110:setName("layout110");

    obj.rectangle89 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle89:setParent(obj.layout110);
    obj.rectangle89:setColor("black");
    obj.rectangle89:setAlign("left");
    obj.rectangle89:setWidth(120);
    obj.rectangle89:setName("rectangle89");

    obj.FALTA_QUAD = GUI.fromHandle(_obj_newObject("label"));
    obj.FALTA_QUAD:setParent(obj.rectangle89);
    obj.FALTA_QUAD:setName("FALTA_QUAD");
    obj.FALTA_QUAD:setText("Marcar Falta");
    obj.FALTA_QUAD:setTop(5);
    obj.FALTA_QUAD:setHorzTextAlign("center");

    obj.edit204 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit204:setParent(obj.layout110);
    obj.edit204:setField("PRE");
    obj.edit204:setAlign("left");
    obj.edit204:setMargins({left = 5});
    obj.edit204:setWidth(30);
    obj.edit204:setHorzTextAlign("center");
    obj.edit204:setReadOnly(true);
    obj.edit204:setName("edit204");

    obj.edit205 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit205:setParent(obj.layout110);
    obj.edit205:setField("VEI_Grad");
    obj.edit205:setAlign("left");
    obj.edit205:setMargins({left = 5});
    obj.edit205:setWidth(30);
    obj.edit205:setHorzTextAlign("center");
    obj.edit205:setReadOnly(true);
    obj.edit205:setName("edit205");

    obj.edit206 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit206:setParent(obj.layout110);
    obj.edit206:setField("FALTA_QUAD_OUT");
    obj.edit206:setAlign("left");
    obj.edit206:setMargins({left = 5});
    obj.edit206:setWidth(30);
    obj.edit206:setHorzTextAlign("center");
    obj.edit206:setName("edit206");

    obj.label131 = GUI.fromHandle(_obj_newObject("label"));
    obj.label131:setParent(obj.layout110);
    obj.label131:setField("FALTA_QUAD_TOTAL");
    obj.label131:setAlign("left");
    obj.label131:setMargins({left = 5});
    obj.label131:setWidth(30);
    obj.label131:setHorzTextAlign("center");
    obj.label131:setName("label131");

    obj.layout111 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout111:setParent(obj.layout100);
    obj.layout111:setHeight(30);
    obj.layout111:setAlign("top");
    obj.layout111:setMargins({top=3});
    obj.layout111:setName("layout111");

    obj.rectangle90 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle90:setParent(obj.layout111);
    obj.rectangle90:setColor("black");
    obj.rectangle90:setAlign("left");
    obj.rectangle90:setWidth(120);
    obj.rectangle90:setName("rectangle90");

    obj.PASS_QUAD = GUI.fromHandle(_obj_newObject("label"));
    obj.PASS_QUAD:setParent(obj.rectangle90);
    obj.PASS_QUAD:setName("PASS_QUAD");
    obj.PASS_QUAD:setText("Passar a Bola");
    obj.PASS_QUAD:setTop(5);
    obj.PASS_QUAD:setHorzTextAlign("center");

    obj.edit207 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit207:setParent(obj.layout111);
    obj.edit207:setField("FOR");
    obj.edit207:setAlign("left");
    obj.edit207:setMargins({left = 5});
    obj.edit207:setWidth(30);
    obj.edit207:setHorzTextAlign("center");
    obj.edit207:setReadOnly(true);
    obj.edit207:setName("edit207");

    obj.edit208 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit208:setParent(obj.layout111);
    obj.edit208:setField("VEI_Grad");
    obj.edit208:setAlign("left");
    obj.edit208:setMargins({left = 5});
    obj.edit208:setWidth(30);
    obj.edit208:setHorzTextAlign("center");
    obj.edit208:setReadOnly(true);
    obj.edit208:setName("edit208");

    obj.edit209 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit209:setParent(obj.layout111);
    obj.edit209:setField("PASS_QUAD_OUT");
    obj.edit209:setAlign("left");
    obj.edit209:setMargins({left = 5});
    obj.edit209:setWidth(30);
    obj.edit209:setHorzTextAlign("center");
    obj.edit209:setName("edit209");

    obj.label132 = GUI.fromHandle(_obj_newObject("label"));
    obj.label132:setParent(obj.layout111);
    obj.label132:setField("PASS_QUAD_TOTAL");
    obj.label132:setAlign("left");
    obj.label132:setMargins({left = 5});
    obj.label132:setWidth(30);
    obj.label132:setHorzTextAlign("center");
    obj.label132:setName("label132");

    obj.layout112 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout112:setParent(obj.layout100);
    obj.layout112:setHeight(30);
    obj.layout112:setAlign("top");
    obj.layout112:setMargins({top=3});
    obj.layout112:setName("layout112");

    obj.rectangle91 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle91:setParent(obj.layout112);
    obj.rectangle91:setColor("black");
    obj.rectangle91:setAlign("left");
    obj.rectangle91:setWidth(120);
    obj.rectangle91:setName("rectangle91");

    obj.REBA_QUAD = GUI.fromHandle(_obj_newObject("label"));
    obj.REBA_QUAD:setParent(obj.rectangle91);
    obj.REBA_QUAD:setName("REBA_QUAD");
    obj.REBA_QUAD:setText("Rebater Balasso");
    obj.REBA_QUAD:setTop(5);
    obj.REBA_QUAD:setHorzTextAlign("center");

    obj.edit210 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit210:setParent(obj.layout112);
    obj.edit210:setField("FOR");
    obj.edit210:setAlign("left");
    obj.edit210:setMargins({left = 5});
    obj.edit210:setWidth(30);
    obj.edit210:setHorzTextAlign("center");
    obj.edit210:setReadOnly(true);
    obj.edit210:setName("edit210");

    obj.edit211 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit211:setParent(obj.layout112);
    obj.edit211:setField("VEI_Grad");
    obj.edit211:setAlign("left");
    obj.edit211:setMargins({left = 5});
    obj.edit211:setWidth(30);
    obj.edit211:setHorzTextAlign("center");
    obj.edit211:setReadOnly(true);
    obj.edit211:setName("edit211");

    obj.edit212 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit212:setParent(obj.layout112);
    obj.edit212:setField("REBA_QUAD_OUT");
    obj.edit212:setAlign("left");
    obj.edit212:setMargins({left = 5});
    obj.edit212:setWidth(30);
    obj.edit212:setHorzTextAlign("center");
    obj.edit212:setName("edit212");

    obj.label133 = GUI.fromHandle(_obj_newObject("label"));
    obj.label133:setParent(obj.layout112);
    obj.label133:setField("REBA_QUAD_TOTAL");
    obj.label133:setAlign("left");
    obj.label133:setMargins({left = 5});
    obj.label133:setWidth(30);
    obj.label133:setHorzTextAlign("center");
    obj.label133:setName("label133");

    obj.layout113 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout113:setParent(obj.layout100);
    obj.layout113:setHeight(30);
    obj.layout113:setAlign("top");
    obj.layout113:setMargins({top=3});
    obj.layout113:setName("layout113");

    obj.rectangle92 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle92:setParent(obj.layout113);
    obj.rectangle92:setColor("black");
    obj.rectangle92:setAlign("left");
    obj.rectangle92:setWidth(120);
    obj.rectangle92:setName("rectangle92");

    obj.ROU_QUAD = GUI.fromHandle(_obj_newObject("label"));
    obj.ROU_QUAD:setParent(obj.rectangle92);
    obj.ROU_QUAD:setName("ROU_QUAD");
    obj.ROU_QUAD:setText("Roubar a bola");
    obj.ROU_QUAD:setTop(5);
    obj.ROU_QUAD:setHorzTextAlign("center");

    obj.edit213 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit213:setParent(obj.layout113);
    obj.edit213:setField("LUT");
    obj.edit213:setAlign("left");
    obj.edit213:setMargins({left = 5});
    obj.edit213:setWidth(30);
    obj.edit213:setHorzTextAlign("center");
    obj.edit213:setReadOnly(true);
    obj.edit213:setName("edit213");

    obj.edit214 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit214:setParent(obj.layout113);
    obj.edit214:setField("VEI_Grad");
    obj.edit214:setAlign("left");
    obj.edit214:setMargins({left = 5});
    obj.edit214:setWidth(30);
    obj.edit214:setHorzTextAlign("center");
    obj.edit214:setReadOnly(true);
    obj.edit214:setName("edit214");

    obj.edit215 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit215:setParent(obj.layout113);
    obj.edit215:setField("ROU_QUAD_OUT");
    obj.edit215:setAlign("left");
    obj.edit215:setMargins({left = 5});
    obj.edit215:setWidth(30);
    obj.edit215:setHorzTextAlign("center");
    obj.edit215:setName("edit215");

    obj.label134 = GUI.fromHandle(_obj_newObject("label"));
    obj.label134:setParent(obj.layout113);
    obj.label134:setField("ROU_QUAD_TOTAL");
    obj.label134:setAlign("left");
    obj.label134:setMargins({left = 5});
    obj.label134:setWidth(30);
    obj.label134:setHorzTextAlign("center");
    obj.label134:setName("label134");

    obj.layout114 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout114:setParent(obj.layout100);
    obj.layout114:setHeight(30);
    obj.layout114:setAlign("top");
    obj.layout114:setMargins({top=3});
    obj.layout114:setName("layout114");

    obj.rectangle93 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle93:setParent(obj.layout114);
    obj.rectangle93:setColor("black");
    obj.rectangle93:setAlign("left");
    obj.rectangle93:setWidth(120);
    obj.rectangle93:setName("rectangle93");

    obj.VEL_QUAD = GUI.fromHandle(_obj_newObject("label"));
    obj.VEL_QUAD:setParent(obj.rectangle93);
    obj.VEL_QUAD:setName("VEL_QUAD");
    obj.VEL_QUAD:setText("Velocidade");
    obj.VEL_QUAD:setTop(5);
    obj.VEL_QUAD:setHorzTextAlign("center");

    obj.edit216 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit216:setParent(obj.layout114);
    obj.edit216:setField("AGI");
    obj.edit216:setAlign("left");
    obj.edit216:setMargins({left = 5});
    obj.edit216:setWidth(30);
    obj.edit216:setHorzTextAlign("center");
    obj.edit216:setReadOnly(true);
    obj.edit216:setName("edit216");

    obj.edit217 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit217:setParent(obj.layout114);
    obj.edit217:setField("VEI_Grad");
    obj.edit217:setAlign("left");
    obj.edit217:setMargins({left = 5});
    obj.edit217:setWidth(30);
    obj.edit217:setHorzTextAlign("center");
    obj.edit217:setReadOnly(true);
    obj.edit217:setName("edit217");

    obj.edit218 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit218:setParent(obj.layout114);
    obj.edit218:setField("VEL_QUAD_OUT");
    obj.edit218:setAlign("left");
    obj.edit218:setMargins({left = 5});
    obj.edit218:setWidth(30);
    obj.edit218:setHorzTextAlign("center");
    obj.edit218:setName("edit218");

    obj.label135 = GUI.fromHandle(_obj_newObject("label"));
    obj.label135:setParent(obj.layout114);
    obj.label135:setField("VEL_QUAD_TOTAL");
    obj.label135:setAlign("left");
    obj.label135:setMargins({left = 5});
    obj.label135:setWidth(30);
    obj.label135:setHorzTextAlign("center");
    obj.label135:setName("label135");

    obj.tab11 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab11:setParent(obj.tabControl1);
    obj.tab11:setTitle("Anotações");
    obj.tab11:setName("tab11");

    obj.scrollBox4 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox4:setParent(obj.tab11);
    obj.scrollBox4:setAlign("client");
    obj.scrollBox4:setName("scrollBox4");

    obj.tabControl4 = GUI.fromHandle(_obj_newObject("tabControl"));
    obj.tabControl4:setParent(obj.scrollBox4);
    obj.tabControl4:setAlign("client");
    obj.tabControl4:setName("tabControl4");

    obj.tab12 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab12:setParent(obj.tabControl4);
    obj.tab12:setTitle("Primeira Aba");
    obj.tab12:setName("tab12");

    obj.richEdit1 = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit1:setParent(obj.tab12);
    obj.richEdit1:setAlign("client");
    obj.richEdit1.backgroundColor = "black";
    obj.richEdit1.defaultFontColor = "white";
    obj.richEdit1:setField("txt1");
    obj.richEdit1:setName("richEdit1");

    obj.tab13 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab13:setParent(obj.tabControl4);
    obj.tab13:setTitle("Segunda Aba");
    obj.tab13:setName("tab13");

    obj.richEdit2 = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit2:setParent(obj.tab13);
    obj.richEdit2:setAlign("client");
    obj.richEdit2.backgroundColor = "black";
    obj.richEdit2.defaultFontColor = "white";
    obj.richEdit2:setField("txt2");
    obj.richEdit2:setName("richEdit2");

    obj.tab14 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab14:setParent(obj.tabControl4);
    obj.tab14:setTitle("Terceira Aba");
    obj.tab14:setName("tab14");

    obj.richEdit3 = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit3:setParent(obj.tab14);
    obj.richEdit3:setAlign("client");
    obj.richEdit3.backgroundColor = "black";
    obj.richEdit3.defaultFontColor = "white";
    obj.richEdit3:setField("txt3");
    obj.richEdit3:setName("richEdit3");

    obj.tab15 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab15:setParent(obj.tabControl4);
    obj.tab15:setTitle("Quarta Aba");
    obj.tab15:setName("tab15");

    obj.richEdit4 = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit4:setParent(obj.tab15);
    obj.richEdit4:setAlign("client");
    obj.richEdit4.backgroundColor = "black";
    obj.richEdit4.defaultFontColor = "white";
    obj.richEdit4:setField("txt4");
    obj.richEdit4:setName("richEdit4");

    obj.tab16 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab16:setParent(obj.tabControl4);
    obj.tab16:setTitle("Quinta Aba");
    obj.tab16:setName("tab16");

    obj.richEdit5 = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit5:setParent(obj.tab16);
    obj.richEdit5:setAlign("client");
    obj.richEdit5.backgroundColor = "black";
    obj.richEdit5.defaultFontColor = "white";
    obj.richEdit5:setField("txt5");
    obj.richEdit5:setName("richEdit5");

    obj.tab17 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab17:setParent(obj.tabControl4);
    obj.tab17:setTitle("Sexta Aba");
    obj.tab17:setName("tab17");

    obj.richEdit6 = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit6:setParent(obj.tab17);
    obj.richEdit6:setAlign("client");
    obj.richEdit6.backgroundColor = "black";
    obj.richEdit6.defaultFontColor = "white";
    obj.richEdit6:setField("txt6");
    obj.richEdit6:setName("richEdit6");

    obj.tab18 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab18:setParent(obj.tabControl4);
    obj.tab18:setTitle("Setima Aba");
    obj.tab18:setName("tab18");

    obj.richEdit7 = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit7:setParent(obj.tab18);
    obj.richEdit7:setAlign("client");
    obj.richEdit7.backgroundColor = "black";
    obj.richEdit7.defaultFontColor = "white";
    obj.richEdit7:setField("txt7");
    obj.richEdit7:setName("richEdit7");

    obj.tab19 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab19:setParent(obj.tabControl4);
    obj.tab19:setTitle("Oitava Aba");
    obj.tab19:setName("tab19");

    obj.richEdit8 = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit8:setParent(obj.tab19);
    obj.richEdit8:setAlign("client");
    obj.richEdit8.backgroundColor = "black";
    obj.richEdit8.defaultFontColor = "white";
    obj.richEdit8:setField("txt8");
    obj.richEdit8:setName("richEdit8");

    obj._e_event0 = obj:addEventListener("onNodeReady",
        function ()
            local campos =
                      {"DES","adivinhacao","azaracao","contraFeitico","encantamento","feitico","transmutacao","arteDasTrevas","fisico","mental","concentracao","acerto"}
                      for x = 1, #campos, 1 do
            
                      if sheet[campos[x]] == nil then
                      sheet[campos[x]] = 0
                      end
            
                      end
            
                      local node = NDB.getRoot(sheet)
                      node.soundControl = "desligado"
        end);

    obj._e_event1 = obj.dataLink1:addEventListener("onChange",
        function (field, oldValue, newValue)
            -- CORPO
            
                           sheet.ACR_Total = (tonumber(sheet.ACR_Grad) or 0) +
                           (tonumber(sheet.AGI) or 0) +
                           (tonumber(sheet.ACR_Out) or 0)
            
                           sheet.ATL_Total = (tonumber(sheet.ATL_Grad) or 0) +
                           (tonumber(sheet.FOR) or 0) +
                           (tonumber(sheet.ATL_Out) or 0)
            
                           sheet.COR_Total = (tonumber(sheet.COR_Grad) or 0) +
                           (tonumber(sheet.LUT) or 0) +
                           (tonumber(sheet.COR_Out) or 0)
            
                           sheet.FUR_Total = (tonumber(sheet.FUR_Grad) or 0) +
                           (tonumber(sheet.AGI) or 0) +
                           (tonumber(sheet.FUR_Out) or 0)
            
                           sheet.PRE_Total = (tonumber(sheet.PRE_Grad) or 0) +
                           (tonumber(sheet.DES) or 0) +
                           (tonumber(sheet.PRE_Out) or 0)
            
                           sheet.VEI_Total = (tonumber(sheet.VEI_Grad) or 0) +
                           (tonumber(sheet.AGI) or 0) +
                           (tonumber(sheet.VEI_Out) or 0)
            
                           -- MENTE
            
                           sheet.CON_Total = (tonumber(sheet.CON_Grad) or 0) +
                           (tonumber(sheet.SAB) or 0) +
                           (tonumber(sheet.CON_Out) or 0)
            
                           sheet.ENG_Total = (tonumber(sheet.ENG_Grad) or 0) +
                           (tonumber(sheet.PRE) or 0) +
                           (tonumber(sheet.ENG_Out) or 0)
            
                           sheet.INT_Total = (tonumber(sheet.INT_Grad) or 0) +
                           (tonumber(sheet.PRE) or 0) +
                           (tonumber(sheet.INT_Out) or 0)
            
                           sheet.INTU_Total = (tonumber(sheet.INTU_Grad) or 0) +
                           (tonumber(sheet.SAB) or 0) +
                           (tonumber(sheet.INTU_Out) or 0)
            
                           sheet.INV_Total = (tonumber(sheet.INV_Grad) or 0) +
                           (tonumber(sheet.INTE) or 0) +
                           (tonumber(sheet.INV_Out) or 0)
            
                           sheet.PERC_Total = (tonumber(sheet.PERC_Grad) or 0) +
                           (tonumber(sheet.SAB) or 0) +
                           (tonumber(sheet.PERC_Out) or 0)
            
                           sheet.PERS_Total = (tonumber(sheet.PERS_Grad) or 0) +
                           (tonumber(sheet.PRE) or 0) +
                           (tonumber(sheet.PERS_Out) or 0)
            
                           sheet.TRA_Total = (tonumber(sheet.TRA_Grad) or 0) +
                           (tonumber(sheet.INTE) or 0) +
                           (tonumber(sheet.TRA_Out) or 0)
            
                           -- CONHECIMENTOS
            
                           sheet.ATU_Total = (tonumber(sheet.ATU_Grad) or 0) +
                           (tonumber(sheet.INTE) or 0) +
                           (tonumber(sheet.ATU_Out) or 0)
            
                           sheet.C_ADI_Total = (tonumber(sheet.C_ADI_Grad) or 0) +
                           (tonumber(sheet.INTE) or 0) +
                           (tonumber(sheet.C_ADI_Out) or 0)
            
                           sheet.C_AZA_Total = (tonumber(sheet.C_AZA_Grad) or 0) +
                           (tonumber(sheet.INTE) or 0) +
                           (tonumber(sheet.C_AZA_Out) or 0)
            
                           sheet.C_CON_Total = (tonumber(sheet.C_CON_Grad) or 0) +
                           (tonumber(sheet.INTE) or 0) +
                           (tonumber(sheet.C_CON_Out) or 0)
            
                           sheet.C_CRI_Total = (tonumber(sheet.C_CRI_Grad) or 0) +
                           (tonumber(sheet.INTE) or 0) +
                           (tonumber(sheet.C_CRI_Out) or 0)
            
                           sheet.C_ENC_Total = (tonumber(sheet.C_ENC_Grad) or 0) +
                           (tonumber(sheet.INTE) or 0) +
                           (tonumber(sheet.C_ENC_Out) or 0)
            
                           sheet.C_FEI_Total = (tonumber(sheet.C_FEI_Grad) or 0) +
                           (tonumber(sheet.INTE) or 0) +
                           (tonumber(sheet.C_FEI_Out) or 0)
            
                           sheet.C_HER_Total = (tonumber(sheet.C_HER_Grad) or 0) +
                           (tonumber(sheet.INTE) or 0) +
                           (tonumber(sheet.C_HER_Out) or 0)
            
                           sheet.C_MAL_Total = (tonumber(sheet.C_MAL_Grad) or 0) +
                           (tonumber(sheet.INTE) or 0) +
                           (tonumber(sheet.C_MAL_Out) or 0)
            
                           sheet.C_POC_Total = (tonumber(sheet.C_POC_Grad) or 0) +
                           (tonumber(sheet.INTE) or 0) +
                           (tonumber(sheet.C_POC_Out) or 0)
            
                           sheet.C_RUN_Total = (tonumber(sheet.C_RUN_Grad) or 0) +
                           (tonumber(sheet.INTE) or 0) +
                           (tonumber(sheet.C_RUN_Out) or 0)
            
                           sheet.C_TRA_Total = (tonumber(sheet.C_TRA_Grad) or 0) +
                           (tonumber(sheet.INTE) or 0) +
                           (tonumber(sheet.C_TRA_Out) or 0)
            
                           -- DEFESAS
            
                           sheet.INI_Total = (tonumber(sheet.INI_Grad) or 0) +
                           (tonumber(sheet.AGI) or 0) +
                           (tonumber(sheet.INI_OUT) or 0)
            
                           sheet.APA_Total = (tonumber(sheet.APA_Grad) or 0) +
                           (tonumber(sheet.LUT) or 0) +
                           (tonumber(sheet.APA_Out) or 0)
            
                           sheet.FORT_Total = (tonumber(sheet.FORT_Grad) or 0) +
                           (tonumber(sheet.VIG) or 0) +
                           (tonumber(sheet.FORT_Out) or 0)
            
                           sheet.REF_Total = (tonumber(sheet.REF_Grad) or 0) +
                           (tonumber(sheet.AGI) or 0) +
                           (tonumber(sheet.REF_Out) or 0)
            
                           sheet.RES_Total = (tonumber(sheet.RES_Grad) or 0) +
                           (tonumber(sheet.VIG) or 0) +
                           (tonumber(sheet.RES_Out) or 0)
            
                           sheet.VON_Total = (tonumber(sheet.VON_Grad) or 0) +
                           (tonumber(sheet.SAB) or 0) +
                           (tonumber(sheet.VON_Out) or 0)
            
                           -- QUADRIBOL
            
                           sheet.ANTE_QUAD_TOTAL = (tonumber(sheet.VEI_Grad) or 0) + (tonumber(sheet.SAB) or 0)
                           +
                           (tonumber(sheet.ANTE_QUAD_OUT) or 0)
            
                           sheet.APAN_QUAD_TOTAL = (tonumber(sheet.VEI_Grad) or 0) + (tonumber(sheet.DES) or 0)
                           +
                           (tonumber(sheet.APAN_QUAD_OUT) or 0)
            
                           sheet.ATRA_QUAD_TOTAL = (tonumber(sheet.VEI_Grad) or 0) + (tonumber(sheet.INTE) or 0)
                           +
                           (tonumber(sheet.ATRA_QUAD_OUT) or 0)
            
                           sheet.DRI_QUAD_TOTAL = (tonumber(sheet.VEI_Grad) or 0) + (tonumber(sheet.AGI) or 0)
                           +
                           (tonumber(sheet.DRI_QUAD_OUT) or 0)
            
                           sheet.GOL_QUAD_TOTAL = (tonumber(sheet.VEI_Grad) or 0) + (tonumber(sheet.FOR) or 0)
                           +
                           (tonumber(sheet.GOL_QUAD_OUT) or 0)
            
                           sheet.FALTA_QUAD_TOTAL = (tonumber(sheet.VEI_Grad) or 0) + (tonumber(sheet.PRE) or 0)
                           +
                           (tonumber(sheet.FALTA_QUAD_OUT) or 0)
            
                           sheet.PASS_QUAD_TOTAL = (tonumber(sheet.VEI_Grad) or 0) + (tonumber(sheet.FOR) or 0)
                           +
                           (tonumber(sheet.PASS_QUAD_OUT) or 0)
            
                           sheet.REBA_QUAD_TOTAL = (tonumber(sheet.VEI_Grad) or 0) + (tonumber(sheet.FOR) or 0)
                           +
                           (tonumber(sheet.REBA_QUAD_OUT) or 0)
            
                           sheet.ROU_QUAD_TOTAL = (tonumber(sheet.VEI_Grad) or 0) + (tonumber(sheet.LUT) or 0)
                           +
                           (tonumber(sheet.ROU_QUAD_OUT) or 0)
            
                           sheet.VEL_QUAD_TOTAL = (tonumber(sheet.VEI_Grad) or 0) + (tonumber(sheet.AGI) or 0)
                           +
                           (tonumber(sheet.VEL_QUAD_OUT) or 0)
            
                           sheet.DEFE_QUAD_TOTAL = (tonumber(sheet.VEI_Grad) or 0) + (tonumber(sheet.AGI) or 0)
                           +
                           (tonumber(sheet.DEFE_QUAD_OUT) or 0)
            
                           sheet.GOL_MOD = cadaDez(sheet.GOL_QUAD_TOTAL + 10) .. "q"
                           sheet.PAS_MOD = cadaDez(sheet.PASS_QUAD_TOTAL + 10) .. "q"
                           sheet.REB_MOD = cadaDez(sheet.REBA_QUAD_TOTAL + 10) .. "q"
                           sheet.VEL_MOD = cadaDez(sheet.VEL_QUAD_TOTAL + 10) .. "q"
        end);

    obj._e_event2 = obj.edit1:addEventListener("onUserChange",
        function ()
        end);

    obj._e_event3 = obj.edit2:addEventListener("onUserChange",
        function ()
        end);

    obj._e_event4 = obj.edit3:addEventListener("onUserChange",
        function ()
        end);

    obj._e_event5 = obj.edit4:addEventListener("onUserChange",
        function ()
        end);

    obj._e_event6 = obj.edit5:addEventListener("onUserChange",
        function ()
        end);

    obj._e_event7 = obj.edit6:addEventListener("onUserChange",
        function ()
        end);

    obj._e_event8 = obj.edit7:addEventListener("onUserChange",
        function ()
        end);

    obj._e_event9 = obj.edit8:addEventListener("onUserChange",
        function ()
        end);

    obj._e_event10 = obj.dataLink2:addEventListener("onChange",
        function (field, oldValue, newValue)
            -- CUIDADO COM A ORGANIZAÇÃO DESSE CODIGO COM XML PODE DAR ERRO
            
                              local minhaMesa = Firecast.getRoomOf(sheet);
                              local chat = minhaMesa.chat;
            
                              if oldValue == nil then
                              return
                              end
            
                              local novoValor = math.abs(newValue or 0)
                              local antigoValor = math.abs(oldValue or 0)
            
                              chat:enviarAcao("Estava com penalidade de Fisica de " .. antigoValor ..
                              " e agora esta com " .. novoValor)
            
                              sheet.fisico = novoValor
        end);

    obj._e_event11 = obj.dataLink3:addEventListener("onChange",
        function (field, oldValue, newValue)
            -- CUIDADO COM A ORGANIZAÇÃO DESSE CODIGO COM XML PODE DAR ERRO
            
                              local minhaMesa = Firecast.getRoomOf(sheet);
                              local chat = minhaMesa.chat;
            
                              if oldValue == nil then
                              return
                              end
            
                              local novoValor = math.abs(newValue or 0)
                              local antigoValor = math.abs(oldValue or 0)
            
                              chat:enviarAcao("Estava com penalidade de Fisica de " .. antigoValor ..
                              " e agora esta com " .. novoValor)
            
                              sheet.mental = novoValor
        end);

    obj._e_event12 = obj.edit11:addEventListener("onUserChange",
        function ()
        end);

    obj._e_event13 = obj.edit12:addEventListener("onUserChange",
        function ()
        end);

    obj._e_event14 = obj.button1:addEventListener("onClick",
        function (event)
            adicionarFeitico()
        end);

    obj._e_event15 = obj.button2:addEventListener("onClick",
        function (event)
            self.rclFeiticos:sort();
        end);

    obj._e_event16 = obj.button3:addEventListener("onClick",
        function (event)
            showMessage(tableToStr(sheet.feiticos, true))
        end);

    obj._e_event17 = obj.rclFeiticos:addEventListener("onSelect",
        function ()
            local node = self.rclFeiticos.selectedNode;
                                 self.boxDetalhesDoItem.node = node;
                                 self.boxDetalhesDoItem.visible = (node ~= nil);
        end);

    obj._e_event18 = obj.rclFeiticos:addEventListener("onCompare",
        function (nodeA, nodeB)
            if (tonumber(nodeA.Order) or 0) < (tonumber(nodeB.Order) or 0) then
                                             return -1;
                                       elseif (tonumber(nodeA.Order) or 0) > (tonumber(nodeB.Order) or 0) then
                                             return 1;
                                       else   
                                             return Utils.compareStringPtBr(nodeA.nome, nodeB.nome);
                                       end;
        end);

    obj._e_event19 = obj.escola:addEventListener("onChange",
        function ()
            local dataScope = self.boxDetalhesDoItem.node
            
                                       if dataScope then
                                       if dataScope.escola == "Contra-Feitiço" then
                                       self.escola.fontColor = "#EABFCB"
                                       elseif dataScope.escola == "Encantamento" then
                                       self.escola.fontColor = "#2BD9FE"
                                       elseif dataScope.escola == "Feitiço" then
                                       self.escola.fontColor = "#7765E3"
                                       elseif dataScope.escola == "Azaração" then
                                       self.escola.fontColor = "#A1683A"
                                       elseif dataScope.escola == "Transmutação" then
                                       self.escola.fontColor = "#E4572E"
                                       elseif dataScope.escola == "Maldição" then
                                       self.escola.fontColor = "#32936F"
                                       elseif dataScope.escola == "Adivinhação" then
                                       self.escola.fontColor = "#BCCCE0"
                                       end
                                       end
        end);

    obj._e_event20 = obj.tipo:addEventListener("onChange",
        function ()
            local dataScope = self.boxDetalhesDoItem.node
            
                                       if dataScope then
                                       if dataScope.tipo == "Ataque" then
                                       self.tipo.fontColor = "#FF0022"
                                       elseif dataScope.tipo == "Defesa" then
                                       self.tipo.fontColor = "#53FF45"
                                       elseif dataScope.tipo == "Cast" then
                                       self.tipo.fontColor = "#E8C547"
                                       end
                                       end
        end);

    obj._e_event21 = obj.edit15:addEventListener("onChange",
        function ()
        end);

    obj._e_event22 = obj.Grad:addEventListener("onMouseEnter",
        function ()
            self.Grad.hint = sheet.Grad
        end);

    obj._e_event23 = obj.button4:addEventListener("onClick",
        function (event)
            local array = totable(sheet.Grad_array)
                                    local grad = tonumber(sheet.Grad_grad)
                                    local result = grad
                                    local graduacoes = tonumber((sheet.CD_grad - 1) + (sheet.Poder_grad - 1 ) + (sheet.Dano_grad - 1) + (sheet.Range_grad - 1) + 
                                    (sheet.Area_grad - 1) + (sheet.Duracao_grad - 1))
            
                                        if grad > 1 then
            
                                            result = result - 1
                                            sheet.Grad_grad = result
                                            sheet.Grad = array[result]
                                        
                                        end
            
                                    
            
                                    local graduacoes = tonumber((sheet.CD_grad - 1) + (sheet.Poder_grad - 1 ) + (sheet.Dano_grad - 1) + (sheet.Range_grad - 1) + 
                                            (sheet.Area_grad - 1) + (sheet.Duracao_grad - 1))
            
                                    if sheet.Grad == tonumber(graduacoes) then
                                        self.rectangle.color = "gray"
                                    elseif sheet.Grad > tonumber(graduacoes) then
                                        self.rectangle.color = "green"
                                    end
        end);

    obj._e_event24 = obj.button5:addEventListener("onClick",
        function (event)
            local array = totable(sheet.Grad_array)
                                    local grad = tonumber(sheet.Grad_grad)
                                    local result = grad
                                    local graduacoes = tonumber((sheet.CD_grad - 1) + (sheet.Poder_grad - 1 ) + (sheet.Dano_grad - 1) + (sheet.Range_grad - 1) + 
                                    (sheet.Area_grad - 1) + (sheet.Duracao_grad - 1))
            
                                    if sheet.Grad > graduacoes then
            
                                        if grad < #array then
            
                                            result = result + 1
                                            sheet.Grad_grad = result
                                            sheet.Grad = array[result]
                                        
                                        end
            
                                    else 
                                    
                                    if sheet.Grad_name == "Grad" then
            
                                        result = result + 1
                                        sheet.Grad_grad = result
                                        sheet.Grad = array[result]
            
                                    end
                                    
            
                                    end
            
                                    local graduacoes = tonumber((sheet.CD_grad - 1) + (sheet.Poder_grad - 1 ) + (sheet.Dano_grad - 1) + (sheet.Range_grad - 1) + 
                                            (sheet.Area_grad - 1) + (sheet.Duracao_grad - 1))
            
                                    if sheet.Grad == tonumber(graduacoes) then
                                        self.rectangle.color = "gray"
                                    elseif sheet.Grad > tonumber(graduacoes) then
                                        self.rectangle.color = "green"
                                    elseif sheet.Grad < tonumber(graduacoes) then
                                        self.rectangle.color = "red"
                                    end
        end);

    obj._e_event25 = obj.edit18:addEventListener("onChange",
        function ()
        end);

    obj._e_event26 = obj.CD:addEventListener("onMouseEnter",
        function ()
            self.CD.hint = sheet.CD
        end);

    obj._e_event27 = obj.button6:addEventListener("onClick",
        function (event)
            local array = totable(sheet.CD_array)
                                    local grad = tonumber(sheet.CD_grad)
                                    local result = grad
                                    local graduacoes = tonumber((sheet.CD_grad - 1) + (sheet.Poder_grad - 1 ) + (sheet.Dano_grad - 1) + (sheet.Range_grad - 1) + 
                                    (sheet.Area_grad - 1) + (sheet.Duracao_grad - 1))
            
                                        if grad > 1 then
            
                                            result = result - 1
                                            sheet.CD_grad = result
                                            sheet.CD = array[result]
                                        
                                        end
            
                                    
            
                                    local graduacoes = tonumber((sheet.CD_grad - 1) + (sheet.Poder_grad - 1 ) + (sheet.Dano_grad - 1) + (sheet.Range_grad - 1) + 
                                            (sheet.Area_grad - 1) + (sheet.Duracao_grad - 1))
            
                                    if sheet.Grad == tonumber(graduacoes) then
                                        self.rectangle.color = "gray"
                                    elseif sheet.Grad > tonumber(graduacoes) then
                                        self.rectangle.color = "green"
                                    end
        end);

    obj._e_event28 = obj.button7:addEventListener("onClick",
        function (event)
            local array = totable(sheet.CD_array)
                                    local grad = tonumber(sheet.CD_grad)
                                    local result = grad
                                    local graduacoes = tonumber((sheet.CD_grad - 1) + (sheet.Poder_grad - 1 ) + (sheet.Dano_grad - 1) + (sheet.Range_grad - 1) + 
                                    (sheet.Area_grad - 1) + (sheet.Duracao_grad - 1))
            
                                    if sheet.Grad > graduacoes then
            
                                        if grad < #array then
            
                                            result = result + 1
                                            sheet.CD_grad = result
                                            sheet.CD = array[result]
                                        
                                        end
            
                                    else 
                                    
                                    if sheet.CD_name == "Grad" then
            
                                        result = result + 1
                                        sheet.CD_grad = result
                                        sheet.CD = array[result]
            
                                    end
                                    
            
                                    end
            
                                    local graduacoes = tonumber((sheet.CD_grad - 1) + (sheet.Poder_grad - 1 ) + (sheet.Dano_grad - 1) + (sheet.Range_grad - 1) + 
                                            (sheet.Area_grad - 1) + (sheet.Duracao_grad - 1))
            
                                    if sheet.Grad == tonumber(graduacoes) then
                                        self.rectangle.color = "gray"
                                    elseif sheet.Grad > tonumber(graduacoes) then
                                        self.rectangle.color = "green"
                                    elseif sheet.Grad < tonumber(graduacoes) then
                                        self.rectangle.color = "red"
                                    end
        end);

    obj._e_event29 = obj.edit21:addEventListener("onChange",
        function ()
        end);

    obj._e_event30 = obj.Efeito:addEventListener("onMouseEnter",
        function ()
            self.Efeito.hint = sheet.Efeito
        end);

    obj._e_event31 = obj.button8:addEventListener("onClick",
        function (event)
            local array = totable(sheet.Efeito_array)
                                    local grad = tonumber(sheet.Efeito_grad)
                                    local result = grad
                                    local graduacoes = tonumber((sheet.CD_grad - 1) + (sheet.Poder_grad - 1 ) + (sheet.Dano_grad - 1) + (sheet.Range_grad - 1) + 
                                    (sheet.Area_grad - 1) + (sheet.Duracao_grad - 1))
            
                                        if grad > 1 then
            
                                            result = result - 1
                                            sheet.Efeito_grad = result
                                            sheet.Efeito = array[result]
                                        
                                        end
            
                                    
            
                                    local graduacoes = tonumber((sheet.CD_grad - 1) + (sheet.Poder_grad - 1 ) + (sheet.Dano_grad - 1) + (sheet.Range_grad - 1) + 
                                            (sheet.Area_grad - 1) + (sheet.Duracao_grad - 1))
            
                                    if sheet.Grad == tonumber(graduacoes) then
                                        self.rectangle.color = "gray"
                                    elseif sheet.Grad > tonumber(graduacoes) then
                                        self.rectangle.color = "green"
                                    end
        end);

    obj._e_event32 = obj.button9:addEventListener("onClick",
        function (event)
            local array = totable(sheet.Efeito_array)
                                    local grad = tonumber(sheet.Efeito_grad)
                                    local result = grad
                                    local graduacoes = tonumber((sheet.CD_grad - 1) + (sheet.Poder_grad - 1 ) + (sheet.Dano_grad - 1) + (sheet.Range_grad - 1) + 
                                    (sheet.Area_grad - 1) + (sheet.Duracao_grad - 1))
            
                                    if sheet.Grad > graduacoes then
            
                                        if grad < #array then
            
                                            result = result + 1
                                            sheet.Efeito_grad = result
                                            sheet.Efeito = array[result]
                                        
                                        end
            
                                    else 
                                    
                                    if sheet.Efeito_name == "Grad" then
            
                                        result = result + 1
                                        sheet.Efeito_grad = result
                                        sheet.Efeito = array[result]
            
                                    end
                                    
            
                                    end
            
                                    local graduacoes = tonumber((sheet.CD_grad - 1) + (sheet.Poder_grad - 1 ) + (sheet.Dano_grad - 1) + (sheet.Range_grad - 1) + 
                                            (sheet.Area_grad - 1) + (sheet.Duracao_grad - 1))
            
                                    if sheet.Grad == tonumber(graduacoes) then
                                        self.rectangle.color = "gray"
                                    elseif sheet.Grad > tonumber(graduacoes) then
                                        self.rectangle.color = "green"
                                    elseif sheet.Grad < tonumber(graduacoes) then
                                        self.rectangle.color = "red"
                                    end
        end);

    obj._e_event33 = obj.edit24:addEventListener("onChange",
        function ()
        end);

    obj._e_event34 = obj.Poder:addEventListener("onMouseEnter",
        function ()
            self.Poder.hint = sheet.Poder
        end);

    obj._e_event35 = obj.button10:addEventListener("onClick",
        function (event)
            local array = totable(sheet.Poder_array)
                                    local grad = tonumber(sheet.Poder_grad)
                                    local result = grad
                                    local graduacoes = tonumber((sheet.CD_grad - 1) + (sheet.Poder_grad - 1 ) + (sheet.Dano_grad - 1) + (sheet.Range_grad - 1) + 
                                    (sheet.Area_grad - 1) + (sheet.Duracao_grad - 1))
            
                                        if grad > 1 then
            
                                            result = result - 1
                                            sheet.Poder_grad = result
                                            sheet.Poder = array[result]
                                        
                                        end
            
                                    
            
                                    local graduacoes = tonumber((sheet.CD_grad - 1) + (sheet.Poder_grad - 1 ) + (sheet.Dano_grad - 1) + (sheet.Range_grad - 1) + 
                                            (sheet.Area_grad - 1) + (sheet.Duracao_grad - 1))
            
                                    if sheet.Grad == tonumber(graduacoes) then
                                        self.rectangle.color = "gray"
                                    elseif sheet.Grad > tonumber(graduacoes) then
                                        self.rectangle.color = "green"
                                    end
        end);

    obj._e_event36 = obj.button11:addEventListener("onClick",
        function (event)
            local array = totable(sheet.Poder_array)
                                    local grad = tonumber(sheet.Poder_grad)
                                    local result = grad
                                    local graduacoes = tonumber((sheet.CD_grad - 1) + (sheet.Poder_grad - 1 ) + (sheet.Dano_grad - 1) + (sheet.Range_grad - 1) + 
                                    (sheet.Area_grad - 1) + (sheet.Duracao_grad - 1))
            
                                    if sheet.Grad > graduacoes then
            
                                        if grad < #array then
            
                                            result = result + 1
                                            sheet.Poder_grad = result
                                            sheet.Poder = array[result]
                                        
                                        end
            
                                    else 
                                    
                                    if sheet.Poder_name == "Grad" then
            
                                        result = result + 1
                                        sheet.Poder_grad = result
                                        sheet.Poder = array[result]
            
                                    end
                                    
            
                                    end
            
                                    local graduacoes = tonumber((sheet.CD_grad - 1) + (sheet.Poder_grad - 1 ) + (sheet.Dano_grad - 1) + (sheet.Range_grad - 1) + 
                                            (sheet.Area_grad - 1) + (sheet.Duracao_grad - 1))
            
                                    if sheet.Grad == tonumber(graduacoes) then
                                        self.rectangle.color = "gray"
                                    elseif sheet.Grad > tonumber(graduacoes) then
                                        self.rectangle.color = "green"
                                    elseif sheet.Grad < tonumber(graduacoes) then
                                        self.rectangle.color = "red"
                                    end
        end);

    obj._e_event37 = obj.edit27:addEventListener("onChange",
        function ()
        end);

    obj._e_event38 = obj.Dano:addEventListener("onMouseEnter",
        function ()
            self.Dano.hint = sheet.Dano
        end);

    obj._e_event39 = obj.button12:addEventListener("onClick",
        function (event)
            local array = totable(sheet.Dano_array)
                                    local grad = tonumber(sheet.Dano_grad)
                                    local result = grad
                                    local graduacoes = tonumber((sheet.CD_grad - 1) + (sheet.Poder_grad - 1 ) + (sheet.Dano_grad - 1) + (sheet.Range_grad - 1) + 
                                    (sheet.Area_grad - 1) + (sheet.Duracao_grad - 1))
            
                                        if grad > 1 then
            
                                            result = result - 1
                                            sheet.Dano_grad = result
                                            sheet.Dano = array[result]
                                        
                                        end
            
                                    
            
                                    local graduacoes = tonumber((sheet.CD_grad - 1) + (sheet.Poder_grad - 1 ) + (sheet.Dano_grad - 1) + (sheet.Range_grad - 1) + 
                                            (sheet.Area_grad - 1) + (sheet.Duracao_grad - 1))
            
                                    if sheet.Grad == tonumber(graduacoes) then
                                        self.rectangle.color = "gray"
                                    elseif sheet.Grad > tonumber(graduacoes) then
                                        self.rectangle.color = "green"
                                    end
        end);

    obj._e_event40 = obj.button13:addEventListener("onClick",
        function (event)
            local array = totable(sheet.Dano_array)
                                    local grad = tonumber(sheet.Dano_grad)
                                    local result = grad
                                    local graduacoes = tonumber((sheet.CD_grad - 1) + (sheet.Poder_grad - 1 ) + (sheet.Dano_grad - 1) + (sheet.Range_grad - 1) + 
                                    (sheet.Area_grad - 1) + (sheet.Duracao_grad - 1))
            
                                    if sheet.Grad > graduacoes then
            
                                        if grad < #array then
            
                                            result = result + 1
                                            sheet.Dano_grad = result
                                            sheet.Dano = array[result]
                                        
                                        end
            
                                    else 
                                    
                                    if sheet.Dano_name == "Grad" then
            
                                        result = result + 1
                                        sheet.Dano_grad = result
                                        sheet.Dano = array[result]
            
                                    end
                                    
            
                                    end
            
                                    local graduacoes = tonumber((sheet.CD_grad - 1) + (sheet.Poder_grad - 1 ) + (sheet.Dano_grad - 1) + (sheet.Range_grad - 1) + 
                                            (sheet.Area_grad - 1) + (sheet.Duracao_grad - 1))
            
                                    if sheet.Grad == tonumber(graduacoes) then
                                        self.rectangle.color = "gray"
                                    elseif sheet.Grad > tonumber(graduacoes) then
                                        self.rectangle.color = "green"
                                    elseif sheet.Grad < tonumber(graduacoes) then
                                        self.rectangle.color = "red"
                                    end
        end);

    obj._e_event41 = obj.edit30:addEventListener("onChange",
        function ()
        end);

    obj._e_event42 = obj.Bonus:addEventListener("onMouseEnter",
        function ()
            self.Bonus.hint = sheet.Bonus
        end);

    obj._e_event43 = obj.button14:addEventListener("onClick",
        function (event)
            local array = totable(sheet.Bonus_array)
                                    local grad = tonumber(sheet.Bonus_grad)
                                    local result = grad
                                    local graduacoes = tonumber((sheet.CD_grad - 1) + (sheet.Poder_grad - 1 ) + (sheet.Dano_grad - 1) + (sheet.Range_grad - 1) + 
                                    (sheet.Area_grad - 1) + (sheet.Duracao_grad - 1))
            
                                        if grad > 1 then
            
                                            result = result - 1
                                            sheet.Bonus_grad = result
                                            sheet.Bonus = array[result]
                                        
                                        end
            
                                    
            
                                    local graduacoes = tonumber((sheet.CD_grad - 1) + (sheet.Poder_grad - 1 ) + (sheet.Dano_grad - 1) + (sheet.Range_grad - 1) + 
                                            (sheet.Area_grad - 1) + (sheet.Duracao_grad - 1))
            
                                    if sheet.Grad == tonumber(graduacoes) then
                                        self.rectangle.color = "gray"
                                    elseif sheet.Grad > tonumber(graduacoes) then
                                        self.rectangle.color = "green"
                                    end
        end);

    obj._e_event44 = obj.button15:addEventListener("onClick",
        function (event)
            local array = totable(sheet.Bonus_array)
                                    local grad = tonumber(sheet.Bonus_grad)
                                    local result = grad
                                    local graduacoes = tonumber((sheet.CD_grad - 1) + (sheet.Poder_grad - 1 ) + (sheet.Dano_grad - 1) + (sheet.Range_grad - 1) + 
                                    (sheet.Area_grad - 1) + (sheet.Duracao_grad - 1))
            
                                    if sheet.Grad > graduacoes then
            
                                        if grad < #array then
            
                                            result = result + 1
                                            sheet.Bonus_grad = result
                                            sheet.Bonus = array[result]
                                        
                                        end
            
                                    else 
                                    
                                    if sheet.Bonus_name == "Grad" then
            
                                        result = result + 1
                                        sheet.Bonus_grad = result
                                        sheet.Bonus = array[result]
            
                                    end
                                    
            
                                    end
            
                                    local graduacoes = tonumber((sheet.CD_grad - 1) + (sheet.Poder_grad - 1 ) + (sheet.Dano_grad - 1) + (sheet.Range_grad - 1) + 
                                            (sheet.Area_grad - 1) + (sheet.Duracao_grad - 1))
            
                                    if sheet.Grad == tonumber(graduacoes) then
                                        self.rectangle.color = "gray"
                                    elseif sheet.Grad > tonumber(graduacoes) then
                                        self.rectangle.color = "green"
                                    elseif sheet.Grad < tonumber(graduacoes) then
                                        self.rectangle.color = "red"
                                    end
        end);

    obj._e_event45 = obj.edit33:addEventListener("onChange",
        function ()
        end);

    obj._e_event46 = obj.Range:addEventListener("onMouseEnter",
        function ()
            self.Range.hint = sheet.Range
        end);

    obj._e_event47 = obj.button16:addEventListener("onClick",
        function (event)
            local array = totable(sheet.Range_array)
                                    local grad = tonumber(sheet.Range_grad)
                                    local result = grad
                                    local graduacoes = tonumber((sheet.CD_grad - 1) + (sheet.Poder_grad - 1 ) + (sheet.Dano_grad - 1) + (sheet.Range_grad - 1) + 
                                    (sheet.Area_grad - 1) + (sheet.Duracao_grad - 1))
            
                                        if grad > 1 then
            
                                            result = result - 1
                                            sheet.Range_grad = result
                                            sheet.Range = array[result]
                                        
                                        end
            
                                    
            
                                    local graduacoes = tonumber((sheet.CD_grad - 1) + (sheet.Poder_grad - 1 ) + (sheet.Dano_grad - 1) + (sheet.Range_grad - 1) + 
                                            (sheet.Area_grad - 1) + (sheet.Duracao_grad - 1))
            
                                    if sheet.Grad == tonumber(graduacoes) then
                                        self.rectangle.color = "gray"
                                    elseif sheet.Grad > tonumber(graduacoes) then
                                        self.rectangle.color = "green"
                                    end
        end);

    obj._e_event48 = obj.button17:addEventListener("onClick",
        function (event)
            local array = totable(sheet.Range_array)
                                    local grad = tonumber(sheet.Range_grad)
                                    local result = grad
                                    local graduacoes = tonumber((sheet.CD_grad - 1) + (sheet.Poder_grad - 1 ) + (sheet.Dano_grad - 1) + (sheet.Range_grad - 1) + 
                                    (sheet.Area_grad - 1) + (sheet.Duracao_grad - 1))
            
                                    if sheet.Grad > graduacoes then
            
                                        if grad < #array then
            
                                            result = result + 1
                                            sheet.Range_grad = result
                                            sheet.Range = array[result]
                                        
                                        end
            
                                    else 
                                    
                                    if sheet.Range_name == "Grad" then
            
                                        result = result + 1
                                        sheet.Range_grad = result
                                        sheet.Range = array[result]
            
                                    end
                                    
            
                                    end
            
                                    local graduacoes = tonumber((sheet.CD_grad - 1) + (sheet.Poder_grad - 1 ) + (sheet.Dano_grad - 1) + (sheet.Range_grad - 1) + 
                                            (sheet.Area_grad - 1) + (sheet.Duracao_grad - 1))
            
                                    if sheet.Grad == tonumber(graduacoes) then
                                        self.rectangle.color = "gray"
                                    elseif sheet.Grad > tonumber(graduacoes) then
                                        self.rectangle.color = "green"
                                    elseif sheet.Grad < tonumber(graduacoes) then
                                        self.rectangle.color = "red"
                                    end
        end);

    obj._e_event49 = obj.edit36:addEventListener("onChange",
        function ()
        end);

    obj._e_event50 = obj.Area:addEventListener("onMouseEnter",
        function ()
            self.Area.hint = sheet.Area
        end);

    obj._e_event51 = obj.button18:addEventListener("onClick",
        function (event)
            local array = totable(sheet.Area_array)
                                    local grad = tonumber(sheet.Area_grad)
                                    local result = grad
                                    local graduacoes = tonumber((sheet.CD_grad - 1) + (sheet.Poder_grad - 1 ) + (sheet.Dano_grad - 1) + (sheet.Range_grad - 1) + 
                                    (sheet.Area_grad - 1) + (sheet.Duracao_grad - 1))
            
                                        if grad > 1 then
            
                                            result = result - 1
                                            sheet.Area_grad = result
                                            sheet.Area = array[result]
                                        
                                        end
            
                                    
            
                                    local graduacoes = tonumber((sheet.CD_grad - 1) + (sheet.Poder_grad - 1 ) + (sheet.Dano_grad - 1) + (sheet.Range_grad - 1) + 
                                            (sheet.Area_grad - 1) + (sheet.Duracao_grad - 1))
            
                                    if sheet.Grad == tonumber(graduacoes) then
                                        self.rectangle.color = "gray"
                                    elseif sheet.Grad > tonumber(graduacoes) then
                                        self.rectangle.color = "green"
                                    end
        end);

    obj._e_event52 = obj.button19:addEventListener("onClick",
        function (event)
            local array = totable(sheet.Area_array)
                                    local grad = tonumber(sheet.Area_grad)
                                    local result = grad
                                    local graduacoes = tonumber((sheet.CD_grad - 1) + (sheet.Poder_grad - 1 ) + (sheet.Dano_grad - 1) + (sheet.Range_grad - 1) + 
                                    (sheet.Area_grad - 1) + (sheet.Duracao_grad - 1))
            
                                    if sheet.Grad > graduacoes then
            
                                        if grad < #array then
            
                                            result = result + 1
                                            sheet.Area_grad = result
                                            sheet.Area = array[result]
                                        
                                        end
            
                                    else 
                                    
                                    if sheet.Area_name == "Grad" then
            
                                        result = result + 1
                                        sheet.Area_grad = result
                                        sheet.Area = array[result]
            
                                    end
                                    
            
                                    end
            
                                    local graduacoes = tonumber((sheet.CD_grad - 1) + (sheet.Poder_grad - 1 ) + (sheet.Dano_grad - 1) + (sheet.Range_grad - 1) + 
                                            (sheet.Area_grad - 1) + (sheet.Duracao_grad - 1))
            
                                    if sheet.Grad == tonumber(graduacoes) then
                                        self.rectangle.color = "gray"
                                    elseif sheet.Grad > tonumber(graduacoes) then
                                        self.rectangle.color = "green"
                                    elseif sheet.Grad < tonumber(graduacoes) then
                                        self.rectangle.color = "red"
                                    end
        end);

    obj._e_event53 = obj.edit39:addEventListener("onChange",
        function ()
        end);

    obj._e_event54 = obj.Duracao:addEventListener("onMouseEnter",
        function ()
            self.Duracao.hint = sheet.Duracao
        end);

    obj._e_event55 = obj.button20:addEventListener("onClick",
        function (event)
            local array = totable(sheet.Duracao_array)
                                    local grad = tonumber(sheet.Duracao_grad)
                                    local result = grad
                                    local graduacoes = tonumber((sheet.CD_grad - 1) + (sheet.Poder_grad - 1 ) + (sheet.Dano_grad - 1) + (sheet.Range_grad - 1) + 
                                    (sheet.Area_grad - 1) + (sheet.Duracao_grad - 1))
            
                                        if grad > 1 then
            
                                            result = result - 1
                                            sheet.Duracao_grad = result
                                            sheet.Duracao = array[result]
                                        
                                        end
            
                                    
            
                                    local graduacoes = tonumber((sheet.CD_grad - 1) + (sheet.Poder_grad - 1 ) + (sheet.Dano_grad - 1) + (sheet.Range_grad - 1) + 
                                            (sheet.Area_grad - 1) + (sheet.Duracao_grad - 1))
            
                                    if sheet.Grad == tonumber(graduacoes) then
                                        self.rectangle.color = "gray"
                                    elseif sheet.Grad > tonumber(graduacoes) then
                                        self.rectangle.color = "green"
                                    end
        end);

    obj._e_event56 = obj.button21:addEventListener("onClick",
        function (event)
            local array = totable(sheet.Duracao_array)
                                    local grad = tonumber(sheet.Duracao_grad)
                                    local result = grad
                                    local graduacoes = tonumber((sheet.CD_grad - 1) + (sheet.Poder_grad - 1 ) + (sheet.Dano_grad - 1) + (sheet.Range_grad - 1) + 
                                    (sheet.Area_grad - 1) + (sheet.Duracao_grad - 1))
            
                                    if sheet.Grad > graduacoes then
            
                                        if grad < #array then
            
                                            result = result + 1
                                            sheet.Duracao_grad = result
                                            sheet.Duracao = array[result]
                                        
                                        end
            
                                    else 
                                    
                                    if sheet.Duracao_name == "Grad" then
            
                                        result = result + 1
                                        sheet.Duracao_grad = result
                                        sheet.Duracao = array[result]
            
                                    end
                                    
            
                                    end
            
                                    local graduacoes = tonumber((sheet.CD_grad - 1) + (sheet.Poder_grad - 1 ) + (sheet.Dano_grad - 1) + (sheet.Range_grad - 1) + 
                                            (sheet.Area_grad - 1) + (sheet.Duracao_grad - 1))
            
                                    if sheet.Grad == tonumber(graduacoes) then
                                        self.rectangle.color = "gray"
                                    elseif sheet.Grad > tonumber(graduacoes) then
                                        self.rectangle.color = "green"
                                    elseif sheet.Grad < tonumber(graduacoes) then
                                        self.rectangle.color = "red"
                                    end
        end);

    obj._e_event57 = obj.button22:addEventListener("onClick",
        function (event)
            rolarFeitico()
        end);

    obj._e_event58 = obj.button23:addEventListener("onClick",
        function (event)
            importarFeitico()
        end);

    obj._e_event59 = obj.button24:addEventListener("onClick",
        function (event)
            Aceitar()
        end);

    obj._e_event60 = obj.button25:addEventListener("onClick",
        function (event)
            abrirPopUp()
        end);

    obj._e_event61 = obj.button26:addEventListener("onClick",
        function (event)
            self.popUp.visible = false
        end);

    obj._e_event62 = obj.button27:addEventListener("onClick",
        function (event)
            self.popUp.visible = false
        end);

    obj._e_event63 = obj.checkBox1:addEventListener("onChange",
        function ()
            local mesaDoPersonagem = Firecast.getRoomOf(sheet);
                                local chat = mesaDoPersonagem.chat
                                local jogador = mesaDoPersonagem.meuJogador
            
                                if sheet.Fadigado then
            
                                if self.Fadigado.text == "Exausto" then
            
                                sheet.Fadigado = nil
                                chat:enviarMensagem(jogador.nick .. " estava Fatigado agora está " ..
                                self.Fadigado.text)
                                elseif self.Fadigado.text == "Tiltado" then
                                sheet.Frustrado = nil
                                chat:enviarMensagem(jogador.nick .. " estava Frustrado agora está " ..
                                self.Fadigado.text)
                                else
                                chat:enviarMensagem(jogador.nick .. " agora está " .. self.Fadigado.text)
            
                                end
            
                                else
                                chat:enviarMensagem(jogador.nick .. " não está mais " .. self.Fadigado.text)
                                end
        end);

    obj._e_event64 = obj.checkBox2:addEventListener("onChange",
        function ()
            local mesaDoPersonagem = Firecast.getRoomOf(sheet);
                                local chat = mesaDoPersonagem.chat
                                local jogador = mesaDoPersonagem.meuJogador
            
                                if sheet.Exausto then
            
                                if self.Exausto.text == "Exausto" then
            
                                sheet.Fadigado = nil
                                chat:enviarMensagem(jogador.nick .. " estava Fatigado agora está " ..
                                self.Exausto.text)
                                elseif self.Exausto.text == "Tiltado" then
                                sheet.Frustrado = nil
                                chat:enviarMensagem(jogador.nick .. " estava Frustrado agora está " ..
                                self.Exausto.text)
                                else
                                chat:enviarMensagem(jogador.nick .. " agora está " .. self.Exausto.text)
            
                                end
            
                                else
                                chat:enviarMensagem(jogador.nick .. " não está mais " .. self.Exausto.text)
                                end
        end);

    obj._e_event65 = obj.checkBox3:addEventListener("onChange",
        function ()
            local mesaDoPersonagem = Firecast.getRoomOf(sheet);
                                local chat = mesaDoPersonagem.chat
                                local jogador = mesaDoPersonagem.meuJogador
            
                                if sheet.Frustrado then
            
                                if self.Frustrado.text == "Exausto" then
            
                                sheet.Fadigado = nil
                                chat:enviarMensagem(jogador.nick .. " estava Fatigado agora está " ..
                                self.Frustrado.text)
                                elseif self.Frustrado.text == "Tiltado" then
                                sheet.Frustrado = nil
                                chat:enviarMensagem(jogador.nick .. " estava Frustrado agora está " ..
                                self.Frustrado.text)
                                else
                                chat:enviarMensagem(jogador.nick .. " agora está " .. self.Frustrado.text)
            
                                end
            
                                else
                                chat:enviarMensagem(jogador.nick .. " não está mais " .. self.Frustrado.text)
                                end
        end);

    obj._e_event66 = obj.checkBox4:addEventListener("onChange",
        function ()
            local mesaDoPersonagem = Firecast.getRoomOf(sheet);
                                local chat = mesaDoPersonagem.chat
                                local jogador = mesaDoPersonagem.meuJogador
            
                                if sheet.Tiltado then
            
                                if self.Tiltado.text == "Exausto" then
            
                                sheet.Fadigado = nil
                                chat:enviarMensagem(jogador.nick .. " estava Fatigado agora está " ..
                                self.Tiltado.text)
                                elseif self.Tiltado.text == "Tiltado" then
                                sheet.Frustrado = nil
                                chat:enviarMensagem(jogador.nick .. " estava Frustrado agora está " ..
                                self.Tiltado.text)
                                else
                                chat:enviarMensagem(jogador.nick .. " agora está " .. self.Tiltado.text)
            
                                end
            
                                else
                                chat:enviarMensagem(jogador.nick .. " não está mais " .. self.Tiltado.text)
                                end
        end);

    obj._e_event67 = obj.rectangle38:addEventListener("onClick",
        function (event)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
                            local chat = mesaDoPersonagem.chat
            
                            local function condition()
            
                            if self.AGILIDADE.text == "AGILIDADE" or
                            self.AGILIDADE.text == "DESTREZA" or
                            self.AGILIDADE.text == "FORÇA" or
                            self.AGILIDADE.text == "LUTA" or
                            self.AGILIDADE.text == "VIGOR" then
            
                            if sheet.Exausto then
                            return -5
                            end
            
                            if sheet.Fadigado then
                            return -2
                            end
            
                            else
            
                            if sheet.Tiltado then
                            return -5
                            end
            
                            if sheet.Frustrado then
                            return -2
                            end
            
                            end
            
                            return nil
                            end
            
            
                            chat:rolarDados("1d20 + " .. (sheet.AGI_OUT or sheet.AGI) .. (condition()
                            and (condition()) or ""),
                            self.AGILIDADE.text,
                            function (rolado)
            
                            end);
        end);

    obj._e_event68 = obj.rectangle39:addEventListener("onClick",
        function (event)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
                            local chat = mesaDoPersonagem.chat
            
                            local function condition()
            
                            if self.DESTREZA.text == "AGILIDADE" or
                            self.DESTREZA.text == "DESTREZA" or
                            self.DESTREZA.text == "FORÇA" or
                            self.DESTREZA.text == "LUTA" or
                            self.DESTREZA.text == "VIGOR" then
            
                            if sheet.Exausto then
                            return -5
                            end
            
                            if sheet.Fadigado then
                            return -2
                            end
            
                            else
            
                            if sheet.Tiltado then
                            return -5
                            end
            
                            if sheet.Frustrado then
                            return -2
                            end
            
                            end
            
                            return nil
                            end
            
            
                            chat:rolarDados("1d20 + " .. (sheet.DES_OUT or sheet.DES) .. (condition()
                            and (condition()) or ""),
                            self.DESTREZA.text,
                            function (rolado)
            
                            end);
        end);

    obj._e_event69 = obj.rectangle40:addEventListener("onClick",
        function (event)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
                            local chat = mesaDoPersonagem.chat
            
                            local function condition()
            
                            if self.FORCA.text == "AGILIDADE" or
                            self.FORCA.text == "DESTREZA" or
                            self.FORCA.text == "FORÇA" or
                            self.FORCA.text == "LUTA" or
                            self.FORCA.text == "VIGOR" then
            
                            if sheet.Exausto then
                            return -5
                            end
            
                            if sheet.Fadigado then
                            return -2
                            end
            
                            else
            
                            if sheet.Tiltado then
                            return -5
                            end
            
                            if sheet.Frustrado then
                            return -2
                            end
            
                            end
            
                            return nil
                            end
            
            
                            chat:rolarDados("1d20 + " .. (sheet.FOR_OUT or sheet.FOR) .. (condition()
                            and (condition()) or ""),
                            self.FORCA.text,
                            function (rolado)
            
                            end);
        end);

    obj._e_event70 = obj.rectangle41:addEventListener("onClick",
        function (event)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
                            local chat = mesaDoPersonagem.chat
            
                            local function condition()
            
                            if self.LUTA.text == "AGILIDADE" or
                            self.LUTA.text == "DESTREZA" or
                            self.LUTA.text == "FORÇA" or
                            self.LUTA.text == "LUTA" or
                            self.LUTA.text == "VIGOR" then
            
                            if sheet.Exausto then
                            return -5
                            end
            
                            if sheet.Fadigado then
                            return -2
                            end
            
                            else
            
                            if sheet.Tiltado then
                            return -5
                            end
            
                            if sheet.Frustrado then
                            return -2
                            end
            
                            end
            
                            return nil
                            end
            
            
                            chat:rolarDados("1d20 + " .. (sheet.LUT_OUT or sheet.LUT) .. (condition()
                            and (condition()) or ""),
                            self.LUTA.text,
                            function (rolado)
            
                            end);
        end);

    obj._e_event71 = obj.rectangle42:addEventListener("onClick",
        function (event)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
                            local chat = mesaDoPersonagem.chat
            
                            local function condition()
            
                            if self.VIGOR.text == "AGILIDADE" or
                            self.VIGOR.text == "DESTREZA" or
                            self.VIGOR.text == "FORÇA" or
                            self.VIGOR.text == "LUTA" or
                            self.VIGOR.text == "VIGOR" then
            
                            if sheet.Exausto then
                            return -5
                            end
            
                            if sheet.Fadigado then
                            return -2
                            end
            
                            else
            
                            if sheet.Tiltado then
                            return -5
                            end
            
                            if sheet.Frustrado then
                            return -2
                            end
            
                            end
            
                            return nil
                            end
            
            
                            chat:rolarDados("1d20 + " .. (sheet.VIG_OUT or sheet.VIG) .. (condition()
                            and (condition()) or ""),
                            self.VIGOR.text,
                            function (rolado)
            
                            end);
        end);

    obj._e_event72 = obj.rectangle44:addEventListener("onClick",
        function (event)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
                            local chat = mesaDoPersonagem.chat
            
                            local function condition()
            
                            if self.INTELIGENCIA.text == "AGILIDADE" or
                            self.INTELIGENCIA.text == "DESTREZA" or
                            self.INTELIGENCIA.text == "FORÇA" or
                            self.INTELIGENCIA.text == "LUTA" or
                            self.INTELIGENCIA.text == "VIGOR" then
            
                            if sheet.Exausto then
                            return -5
                            end
            
                            if sheet.Fadigado then
                            return -2
                            end
            
                            else
            
                            if sheet.Tiltado then
                            return -5
                            end
            
                            if sheet.Frustrado then
                            return -2
                            end
            
                            end
            
                            return nil
                            end
            
            
                            chat:rolarDados("1d20 + " .. (sheet.INTE_OUT or sheet.INTE) .. (condition()
                            and (condition()) or ""),
                            self.INTELIGENCIA.text,
                            function (rolado)
            
                            end);
        end);

    obj._e_event73 = obj.rectangle45:addEventListener("onClick",
        function (event)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
                            local chat = mesaDoPersonagem.chat
            
                            local function condition()
            
                            if self.PRESENCA.text == "AGILIDADE" or
                            self.PRESENCA.text == "DESTREZA" or
                            self.PRESENCA.text == "FORÇA" or
                            self.PRESENCA.text == "LUTA" or
                            self.PRESENCA.text == "VIGOR" then
            
                            if sheet.Exausto then
                            return -5
                            end
            
                            if sheet.Fadigado then
                            return -2
                            end
            
                            else
            
                            if sheet.Tiltado then
                            return -5
                            end
            
                            if sheet.Frustrado then
                            return -2
                            end
            
                            end
            
                            return nil
                            end
            
            
                            chat:rolarDados("1d20 + " .. (sheet.PRES_OUT or sheet.PRE) .. (condition()
                            and (condition()) or ""),
                            self.PRESENCA.text,
                            function (rolado)
            
                            end);
        end);

    obj._e_event74 = obj.rectangle46:addEventListener("onClick",
        function (event)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
                            local chat = mesaDoPersonagem.chat
            
                            local function condition()
            
                            if self.SABEDORIA.text == "AGILIDADE" or
                            self.SABEDORIA.text == "DESTREZA" or
                            self.SABEDORIA.text == "FORÇA" or
                            self.SABEDORIA.text == "LUTA" or
                            self.SABEDORIA.text == "VIGOR" then
            
                            if sheet.Exausto then
                            return -5
                            end
            
                            if sheet.Fadigado then
                            return -2
                            end
            
                            else
            
                            if sheet.Tiltado then
                            return -5
                            end
            
                            if sheet.Frustrado then
                            return -2
                            end
            
                            end
            
                            return nil
                            end
            
            
                            chat:rolarDados("1d20 + " .. (sheet.SAB_OUT or sheet.SAB) .. (condition()
                            and (condition()) or ""),
                            self.SABEDORIA.text,
                            function (rolado)
            
                            end);
        end);

    obj._e_event75 = obj.rectangle47:addEventListener("onClick",
        function (event)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
                                local chat = mesaDoPersonagem.chat
            
                                local function condition()
            
                                if self.Acrobacia.text == "Acrobacia" or
                                self.Acrobacia.text == "Atletismo" or
                                self.Acrobacia.text == "Corpo-a-Corpo" or
                                self.Acrobacia.text == "Furtividade" or
                                self.Acrobacia.text == "Prestidigitação" or
                                self.Acrobacia.text == "Veiculos Mágicos" or
                                self.Acrobacia.text == "Iniciativa" or
                                self.Acrobacia.text == "Aparar" or
                                self.Acrobacia.text == "Fortitude" or
                                self.Acrobacia.text == "Reflexo" or
                                self.Acrobacia.text == "Resistencia" then
            
                                if sheet.Exausto then
                                return -5
                                end
            
                                if sheet.Fadigado then
                                return -2
                                end
            
                                else
            
                                if sheet.Tiltado then
                                return -5
                                end
            
                                if sheet.Frustrado then
                                return -2
                                end
            
                                end
            
                                return nil
                                end
            
                                chat:rolarDados("1d20 + " .. (sheet.ACR_Total or 0) .. (condition()
                                and (condition()) or ""),
                                self.Acrobacia.text,
                                function (rolado)
            
                                end);
        end);

    obj._e_event76 = obj.rectangle48:addEventListener("onClick",
        function (event)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
                                local chat = mesaDoPersonagem.chat
            
                                local function condition()
            
                                if self.Atletismo.text == "Acrobacia" or
                                self.Atletismo.text == "Atletismo" or
                                self.Atletismo.text == "Corpo-a-Corpo" or
                                self.Atletismo.text == "Furtividade" or
                                self.Atletismo.text == "Prestidigitação" or
                                self.Atletismo.text == "Veiculos Mágicos" or
                                self.Atletismo.text == "Iniciativa" or
                                self.Atletismo.text == "Aparar" or
                                self.Atletismo.text == "Fortitude" or
                                self.Atletismo.text == "Reflexo" or
                                self.Atletismo.text == "Resistencia" then
            
                                if sheet.Exausto then
                                return -5
                                end
            
                                if sheet.Fadigado then
                                return -2
                                end
            
                                else
            
                                if sheet.Tiltado then
                                return -5
                                end
            
                                if sheet.Frustrado then
                                return -2
                                end
            
                                end
            
                                return nil
                                end
            
                                chat:rolarDados("1d20 + " .. (sheet.ATL_Total or 0) .. (condition()
                                and (condition()) or ""),
                                self.Atletismo.text,
                                function (rolado)
            
                                end);
        end);

    obj._e_event77 = obj.rectangle49:addEventListener("onClick",
        function (event)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
                                local chat = mesaDoPersonagem.chat
            
                                local function condition()
            
                                if self.CorpoACorpo.text == "Acrobacia" or
                                self.CorpoACorpo.text == "Atletismo" or
                                self.CorpoACorpo.text == "Corpo-a-Corpo" or
                                self.CorpoACorpo.text == "Furtividade" or
                                self.CorpoACorpo.text == "Prestidigitação" or
                                self.CorpoACorpo.text == "Veiculos Mágicos" or
                                self.CorpoACorpo.text == "Iniciativa" or
                                self.CorpoACorpo.text == "Aparar" or
                                self.CorpoACorpo.text == "Fortitude" or
                                self.CorpoACorpo.text == "Reflexo" or
                                self.CorpoACorpo.text == "Resistencia" then
            
                                if sheet.Exausto then
                                return -5
                                end
            
                                if sheet.Fadigado then
                                return -2
                                end
            
                                else
            
                                if sheet.Tiltado then
                                return -5
                                end
            
                                if sheet.Frustrado then
                                return -2
                                end
            
                                end
            
                                return nil
                                end
            
                                chat:rolarDados("1d20 + " .. (sheet.COR_Total or 0) .. (condition()
                                and (condition()) or ""),
                                self.CorpoACorpo.text,
                                function (rolado)
            
                                end);
        end);

    obj._e_event78 = obj.rectangle50:addEventListener("onClick",
        function (event)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
                                local chat = mesaDoPersonagem.chat
            
                                local function condition()
            
                                if self.Furtividade.text == "Acrobacia" or
                                self.Furtividade.text == "Atletismo" or
                                self.Furtividade.text == "Corpo-a-Corpo" or
                                self.Furtividade.text == "Furtividade" or
                                self.Furtividade.text == "Prestidigitação" or
                                self.Furtividade.text == "Veiculos Mágicos" or
                                self.Furtividade.text == "Iniciativa" or
                                self.Furtividade.text == "Aparar" or
                                self.Furtividade.text == "Fortitude" or
                                self.Furtividade.text == "Reflexo" or
                                self.Furtividade.text == "Resistencia" then
            
                                if sheet.Exausto then
                                return -5
                                end
            
                                if sheet.Fadigado then
                                return -2
                                end
            
                                else
            
                                if sheet.Tiltado then
                                return -5
                                end
            
                                if sheet.Frustrado then
                                return -2
                                end
            
                                end
            
                                return nil
                                end
            
                                chat:rolarDados("1d20 + " .. (sheet.FUR_Total or 0) .. (condition()
                                and (condition()) or ""),
                                self.Furtividade.text,
                                function (rolado)
            
                                end);
        end);

    obj._e_event79 = obj.rectangle51:addEventListener("onClick",
        function (event)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
                                local chat = mesaDoPersonagem.chat
            
                                local function condition()
            
                                if self.Prestidigitacao.text == "Acrobacia" or
                                self.Prestidigitacao.text == "Atletismo" or
                                self.Prestidigitacao.text == "Corpo-a-Corpo" or
                                self.Prestidigitacao.text == "Furtividade" or
                                self.Prestidigitacao.text == "Prestidigitação" or
                                self.Prestidigitacao.text == "Veiculos Mágicos" or
                                self.Prestidigitacao.text == "Iniciativa" or
                                self.Prestidigitacao.text == "Aparar" or
                                self.Prestidigitacao.text == "Fortitude" or
                                self.Prestidigitacao.text == "Reflexo" or
                                self.Prestidigitacao.text == "Resistencia" then
            
                                if sheet.Exausto then
                                return -5
                                end
            
                                if sheet.Fadigado then
                                return -2
                                end
            
                                else
            
                                if sheet.Tiltado then
                                return -5
                                end
            
                                if sheet.Frustrado then
                                return -2
                                end
            
                                end
            
                                return nil
                                end
            
                                chat:rolarDados("1d20 + " .. (sheet.PRE_Total or 0) .. (condition()
                                and (condition()) or ""),
                                self.Prestidigitacao.text,
                                function (rolado)
            
                                end);
        end);

    obj._e_event80 = obj.rectangle52:addEventListener("onClick",
        function (event)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
                                local chat = mesaDoPersonagem.chat
            
                                local function condition()
            
                                if self.VeiculosMagicos.text == "Acrobacia" or
                                self.VeiculosMagicos.text == "Atletismo" or
                                self.VeiculosMagicos.text == "Corpo-a-Corpo" or
                                self.VeiculosMagicos.text == "Furtividade" or
                                self.VeiculosMagicos.text == "Prestidigitação" or
                                self.VeiculosMagicos.text == "Veiculos Mágicos" or
                                self.VeiculosMagicos.text == "Iniciativa" or
                                self.VeiculosMagicos.text == "Aparar" or
                                self.VeiculosMagicos.text == "Fortitude" or
                                self.VeiculosMagicos.text == "Reflexo" or
                                self.VeiculosMagicos.text == "Resistencia" then
            
                                if sheet.Exausto then
                                return -5
                                end
            
                                if sheet.Fadigado then
                                return -2
                                end
            
                                else
            
                                if sheet.Tiltado then
                                return -5
                                end
            
                                if sheet.Frustrado then
                                return -2
                                end
            
                                end
            
                                return nil
                                end
            
                                chat:rolarDados("1d20 + " .. (sheet.VEI_Total or 0) .. (condition()
                                and (condition()) or ""),
                                self.VeiculosMagicos.text,
                                function (rolado)
            
                                end);
        end);

    obj._e_event81 = obj.rectangle53:addEventListener("onClick",
        function (event)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
                                local chat = mesaDoPersonagem.chat
            
                                local function condition()
            
                                if self.Concentracao.text == "Acrobacia" or
                                self.Concentracao.text == "Atletismo" or
                                self.Concentracao.text == "Corpo-a-Corpo" or
                                self.Concentracao.text == "Furtividade" or
                                self.Concentracao.text == "Prestidigitação" or
                                self.Concentracao.text == "Veiculos Mágicos" or
                                self.Concentracao.text == "Iniciativa" or
                                self.Concentracao.text == "Aparar" or
                                self.Concentracao.text == "Fortitude" or
                                self.Concentracao.text == "Reflexo" or
                                self.Concentracao.text == "Resistencia" then
            
                                if sheet.Exausto then
                                return -5
                                end
            
                                if sheet.Fadigado then
                                return -2
                                end
            
                                else
            
                                if sheet.Tiltado then
                                return -5
                                end
            
                                if sheet.Frustrado then
                                return -2
                                end
            
                                end
            
                                return nil
                                end
            
                                chat:rolarDados("1d20 + " .. (sheet.CON_Total or 0) .. (condition()
                                and (condition()) or ""),
                                self.Concentracao.text,
                                function (rolado)
            
                                end);
        end);

    obj._e_event82 = obj.rectangle54:addEventListener("onClick",
        function (event)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
                                local chat = mesaDoPersonagem.chat
            
                                local function condition()
            
                                if self.Enganacao.text == "Acrobacia" or
                                self.Enganacao.text == "Atletismo" or
                                self.Enganacao.text == "Corpo-a-Corpo" or
                                self.Enganacao.text == "Furtividade" or
                                self.Enganacao.text == "Prestidigitação" or
                                self.Enganacao.text == "Veiculos Mágicos" or
                                self.Enganacao.text == "Iniciativa" or
                                self.Enganacao.text == "Aparar" or
                                self.Enganacao.text == "Fortitude" or
                                self.Enganacao.text == "Reflexo" or
                                self.Enganacao.text == "Resistencia" then
            
                                if sheet.Exausto then
                                return -5
                                end
            
                                if sheet.Fadigado then
                                return -2
                                end
            
                                else
            
                                if sheet.Tiltado then
                                return -5
                                end
            
                                if sheet.Frustrado then
                                return -2
                                end
            
                                end
            
                                return nil
                                end
            
                                chat:rolarDados("1d20 + " .. (sheet.ENG_Total or 0) .. (condition()
                                and (condition()) or ""),
                                self.Enganacao.text,
                                function (rolado)
            
                                end);
        end);

    obj._e_event83 = obj.rectangle55:addEventListener("onClick",
        function (event)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
                                local chat = mesaDoPersonagem.chat
            
                                local function condition()
            
                                if self.Intimidacao.text == "Acrobacia" or
                                self.Intimidacao.text == "Atletismo" or
                                self.Intimidacao.text == "Corpo-a-Corpo" or
                                self.Intimidacao.text == "Furtividade" or
                                self.Intimidacao.text == "Prestidigitação" or
                                self.Intimidacao.text == "Veiculos Mágicos" or
                                self.Intimidacao.text == "Iniciativa" or
                                self.Intimidacao.text == "Aparar" or
                                self.Intimidacao.text == "Fortitude" or
                                self.Intimidacao.text == "Reflexo" or
                                self.Intimidacao.text == "Resistencia" then
            
                                if sheet.Exausto then
                                return -5
                                end
            
                                if sheet.Fadigado then
                                return -2
                                end
            
                                else
            
                                if sheet.Tiltado then
                                return -5
                                end
            
                                if sheet.Frustrado then
                                return -2
                                end
            
                                end
            
                                return nil
                                end
            
                                chat:rolarDados("1d20 + " .. (sheet.INT_Total or 0) .. (condition()
                                and (condition()) or ""),
                                self.Intimidacao.text,
                                function (rolado)
            
                                end);
        end);

    obj._e_event84 = obj.rectangle56:addEventListener("onClick",
        function (event)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
                                local chat = mesaDoPersonagem.chat
            
                                local function condition()
            
                                if self.Intuicao.text == "Acrobacia" or
                                self.Intuicao.text == "Atletismo" or
                                self.Intuicao.text == "Corpo-a-Corpo" or
                                self.Intuicao.text == "Furtividade" or
                                self.Intuicao.text == "Prestidigitação" or
                                self.Intuicao.text == "Veiculos Mágicos" or
                                self.Intuicao.text == "Iniciativa" or
                                self.Intuicao.text == "Aparar" or
                                self.Intuicao.text == "Fortitude" or
                                self.Intuicao.text == "Reflexo" or
                                self.Intuicao.text == "Resistencia" then
            
                                if sheet.Exausto then
                                return -5
                                end
            
                                if sheet.Fadigado then
                                return -2
                                end
            
                                else
            
                                if sheet.Tiltado then
                                return -5
                                end
            
                                if sheet.Frustrado then
                                return -2
                                end
            
                                end
            
                                return nil
                                end
            
                                chat:rolarDados("1d20 + " .. (sheet.INTU_Total or 0) .. (condition()
                                and (condition()) or ""),
                                self.Intuicao.text,
                                function (rolado)
            
                                end);
        end);

    obj._e_event85 = obj.rectangle57:addEventListener("onClick",
        function (event)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
                                local chat = mesaDoPersonagem.chat
            
                                local function condition()
            
                                if self.Investigacao.text == "Acrobacia" or
                                self.Investigacao.text == "Atletismo" or
                                self.Investigacao.text == "Corpo-a-Corpo" or
                                self.Investigacao.text == "Furtividade" or
                                self.Investigacao.text == "Prestidigitação" or
                                self.Investigacao.text == "Veiculos Mágicos" or
                                self.Investigacao.text == "Iniciativa" or
                                self.Investigacao.text == "Aparar" or
                                self.Investigacao.text == "Fortitude" or
                                self.Investigacao.text == "Reflexo" or
                                self.Investigacao.text == "Resistencia" then
            
                                if sheet.Exausto then
                                return -5
                                end
            
                                if sheet.Fadigado then
                                return -2
                                end
            
                                else
            
                                if sheet.Tiltado then
                                return -5
                                end
            
                                if sheet.Frustrado then
                                return -2
                                end
            
                                end
            
                                return nil
                                end
            
                                chat:rolarDados("1d20 + " .. (sheet.INV_Total or 0) .. (condition()
                                and (condition()) or ""),
                                self.Investigacao.text,
                                function (rolado)
            
                                end);
        end);

    obj._e_event86 = obj.rectangle58:addEventListener("onClick",
        function (event)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
                                local chat = mesaDoPersonagem.chat
            
                                local function condition()
            
                                if self.Percepcao.text == "Acrobacia" or
                                self.Percepcao.text == "Atletismo" or
                                self.Percepcao.text == "Corpo-a-Corpo" or
                                self.Percepcao.text == "Furtividade" or
                                self.Percepcao.text == "Prestidigitação" or
                                self.Percepcao.text == "Veiculos Mágicos" or
                                self.Percepcao.text == "Iniciativa" or
                                self.Percepcao.text == "Aparar" or
                                self.Percepcao.text == "Fortitude" or
                                self.Percepcao.text == "Reflexo" or
                                self.Percepcao.text == "Resistencia" then
            
                                if sheet.Exausto then
                                return -5
                                end
            
                                if sheet.Fadigado then
                                return -2
                                end
            
                                else
            
                                if sheet.Tiltado then
                                return -5
                                end
            
                                if sheet.Frustrado then
                                return -2
                                end
            
                                end
            
                                return nil
                                end
            
                                chat:rolarDados("1d20 + " .. (sheet.PERC_Total or 0) .. (condition()
                                and (condition()) or ""),
                                self.Percepcao.text,
                                function (rolado)
            
                                end);
        end);

    obj._e_event87 = obj.rectangle59:addEventListener("onClick",
        function (event)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
                                local chat = mesaDoPersonagem.chat
            
                                local function condition()
            
                                if self.Persuacao.text == "Acrobacia" or
                                self.Persuacao.text == "Atletismo" or
                                self.Persuacao.text == "Corpo-a-Corpo" or
                                self.Persuacao.text == "Furtividade" or
                                self.Persuacao.text == "Prestidigitação" or
                                self.Persuacao.text == "Veiculos Mágicos" or
                                self.Persuacao.text == "Iniciativa" or
                                self.Persuacao.text == "Aparar" or
                                self.Persuacao.text == "Fortitude" or
                                self.Persuacao.text == "Reflexo" or
                                self.Persuacao.text == "Resistencia" then
            
                                if sheet.Exausto then
                                return -5
                                end
            
                                if sheet.Fadigado then
                                return -2
                                end
            
                                else
            
                                if sheet.Tiltado then
                                return -5
                                end
            
                                if sheet.Frustrado then
                                return -2
                                end
            
                                end
            
                                return nil
                                end
            
                                chat:rolarDados("1d20 + " .. (sheet.PERS_Total or 0) .. (condition()
                                and (condition()) or ""),
                                self.Persuacao.text,
                                function (rolado)
            
                                end);
        end);

    obj._e_event88 = obj.rectangle60:addEventListener("onClick",
        function (event)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
                                local chat = mesaDoPersonagem.chat
            
                                local function condition()
            
                                if self.Tratamento.text == "Acrobacia" or
                                self.Tratamento.text == "Atletismo" or
                                self.Tratamento.text == "Corpo-a-Corpo" or
                                self.Tratamento.text == "Furtividade" or
                                self.Tratamento.text == "Prestidigitação" or
                                self.Tratamento.text == "Veiculos Mágicos" or
                                self.Tratamento.text == "Iniciativa" or
                                self.Tratamento.text == "Aparar" or
                                self.Tratamento.text == "Fortitude" or
                                self.Tratamento.text == "Reflexo" or
                                self.Tratamento.text == "Resistencia" then
            
                                if sheet.Exausto then
                                return -5
                                end
            
                                if sheet.Fadigado then
                                return -2
                                end
            
                                else
            
                                if sheet.Tiltado then
                                return -5
                                end
            
                                if sheet.Frustrado then
                                return -2
                                end
            
                                end
            
                                return nil
                                end
            
                                chat:rolarDados("1d20 + " .. (sheet.TRA_Total or 0) .. (condition()
                                and (condition()) or ""),
                                self.Tratamento.text,
                                function (rolado)
            
                                end);
        end);

    obj._e_event89 = obj.rectangle61:addEventListener("onClick",
        function (event)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
                                local chat = mesaDoPersonagem.chat
            
                                local function condition()
            
                                if self.Atualidades.text == "Acrobacia" or
                                self.Atualidades.text == "Atletismo" or
                                self.Atualidades.text == "Corpo-a-Corpo" or
                                self.Atualidades.text == "Furtividade" or
                                self.Atualidades.text == "Prestidigitação" or
                                self.Atualidades.text == "Veiculos Mágicos" or
                                self.Atualidades.text == "Iniciativa" or
                                self.Atualidades.text == "Aparar" or
                                self.Atualidades.text == "Fortitude" or
                                self.Atualidades.text == "Reflexo" or
                                self.Atualidades.text == "Resistencia" then
            
                                if sheet.Exausto then
                                return -5
                                end
            
                                if sheet.Fadigado then
                                return -2
                                end
            
                                else
            
                                if sheet.Tiltado then
                                return -5
                                end
            
                                if sheet.Frustrado then
                                return -2
                                end
            
                                end
            
                                return nil
                                end
            
                                chat:rolarDados("1d20 + " .. (sheet.ATU_Total or 0) .. (condition()
                                and (condition()) or ""),
                                self.Atualidades.text,
                                function (rolado)
            
                                end);
        end);

    obj._e_event90 = obj.rectangle62:addEventListener("onClick",
        function (event)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
                                local chat = mesaDoPersonagem.chat
            
                                local function condition()
            
                                if self.Adivinhacao.text == "Acrobacia" or
                                self.Adivinhacao.text == "Atletismo" or
                                self.Adivinhacao.text == "Corpo-a-Corpo" or
                                self.Adivinhacao.text == "Furtividade" or
                                self.Adivinhacao.text == "Prestidigitação" or
                                self.Adivinhacao.text == "Veiculos Mágicos" or
                                self.Adivinhacao.text == "Iniciativa" or
                                self.Adivinhacao.text == "Aparar" or
                                self.Adivinhacao.text == "Fortitude" or
                                self.Adivinhacao.text == "Reflexo" or
                                self.Adivinhacao.text == "Resistencia" then
            
                                if sheet.Exausto then
                                return -5
                                end
            
                                if sheet.Fadigado then
                                return -2
                                end
            
                                else
            
                                if sheet.Tiltado then
                                return -5
                                end
            
                                if sheet.Frustrado then
                                return -2
                                end
            
                                end
            
                                return nil
                                end
            
                                chat:rolarDados("1d20 + " .. (sheet.C_ADI_Total or 0) .. (condition()
                                and (condition()) or ""),
                                self.Adivinhacao.text,
                                function (rolado)
            
                                end);
        end);

    obj._e_event91 = obj.rectangle63:addEventListener("onClick",
        function (event)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
                                local chat = mesaDoPersonagem.chat
            
                                local function condition()
            
                                if self.Azaracao.text == "Acrobacia" or
                                self.Azaracao.text == "Atletismo" or
                                self.Azaracao.text == "Corpo-a-Corpo" or
                                self.Azaracao.text == "Furtividade" or
                                self.Azaracao.text == "Prestidigitação" or
                                self.Azaracao.text == "Veiculos Mágicos" or
                                self.Azaracao.text == "Iniciativa" or
                                self.Azaracao.text == "Aparar" or
                                self.Azaracao.text == "Fortitude" or
                                self.Azaracao.text == "Reflexo" or
                                self.Azaracao.text == "Resistencia" then
            
                                if sheet.Exausto then
                                return -5
                                end
            
                                if sheet.Fadigado then
                                return -2
                                end
            
                                else
            
                                if sheet.Tiltado then
                                return -5
                                end
            
                                if sheet.Frustrado then
                                return -2
                                end
            
                                end
            
                                return nil
                                end
            
                                chat:rolarDados("1d20 + " .. (sheet.C_AZA_Total or 0) .. (condition()
                                and (condition()) or ""),
                                self.Azaracao.text,
                                function (rolado)
            
                                end);
        end);

    obj._e_event92 = obj.rectangle64:addEventListener("onClick",
        function (event)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
                                local chat = mesaDoPersonagem.chat
            
                                local function condition()
            
                                if self.ContraFeitico.text == "Acrobacia" or
                                self.ContraFeitico.text == "Atletismo" or
                                self.ContraFeitico.text == "Corpo-a-Corpo" or
                                self.ContraFeitico.text == "Furtividade" or
                                self.ContraFeitico.text == "Prestidigitação" or
                                self.ContraFeitico.text == "Veiculos Mágicos" or
                                self.ContraFeitico.text == "Iniciativa" or
                                self.ContraFeitico.text == "Aparar" or
                                self.ContraFeitico.text == "Fortitude" or
                                self.ContraFeitico.text == "Reflexo" or
                                self.ContraFeitico.text == "Resistencia" then
            
                                if sheet.Exausto then
                                return -5
                                end
            
                                if sheet.Fadigado then
                                return -2
                                end
            
                                else
            
                                if sheet.Tiltado then
                                return -5
                                end
            
                                if sheet.Frustrado then
                                return -2
                                end
            
                                end
            
                                return nil
                                end
            
                                chat:rolarDados("1d20 + " .. (sheet.C_CON_Total or 0) .. (condition()
                                and (condition()) or ""),
                                self.ContraFeitico.text,
                                function (rolado)
            
                                end);
        end);

    obj._e_event93 = obj.rectangle65:addEventListener("onClick",
        function (event)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
                                local chat = mesaDoPersonagem.chat
            
                                local function condition()
            
                                if self.CriaturasMagicas.text == "Acrobacia" or
                                self.CriaturasMagicas.text == "Atletismo" or
                                self.CriaturasMagicas.text == "Corpo-a-Corpo" or
                                self.CriaturasMagicas.text == "Furtividade" or
                                self.CriaturasMagicas.text == "Prestidigitação" or
                                self.CriaturasMagicas.text == "Veiculos Mágicos" or
                                self.CriaturasMagicas.text == "Iniciativa" or
                                self.CriaturasMagicas.text == "Aparar" or
                                self.CriaturasMagicas.text == "Fortitude" or
                                self.CriaturasMagicas.text == "Reflexo" or
                                self.CriaturasMagicas.text == "Resistencia" then
            
                                if sheet.Exausto then
                                return -5
                                end
            
                                if sheet.Fadigado then
                                return -2
                                end
            
                                else
            
                                if sheet.Tiltado then
                                return -5
                                end
            
                                if sheet.Frustrado then
                                return -2
                                end
            
                                end
            
                                return nil
                                end
            
                                chat:rolarDados("1d20 + " .. (sheet.C_CRI_Total or 0) .. (condition()
                                and (condition()) or ""),
                                self.CriaturasMagicas.text,
                                function (rolado)
            
                                end);
        end);

    obj._e_event94 = obj.rectangle66:addEventListener("onClick",
        function (event)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
                                local chat = mesaDoPersonagem.chat
            
                                local function condition()
            
                                if self.Encantamentos.text == "Acrobacia" or
                                self.Encantamentos.text == "Atletismo" or
                                self.Encantamentos.text == "Corpo-a-Corpo" or
                                self.Encantamentos.text == "Furtividade" or
                                self.Encantamentos.text == "Prestidigitação" or
                                self.Encantamentos.text == "Veiculos Mágicos" or
                                self.Encantamentos.text == "Iniciativa" or
                                self.Encantamentos.text == "Aparar" or
                                self.Encantamentos.text == "Fortitude" or
                                self.Encantamentos.text == "Reflexo" or
                                self.Encantamentos.text == "Resistencia" then
            
                                if sheet.Exausto then
                                return -5
                                end
            
                                if sheet.Fadigado then
                                return -2
                                end
            
                                else
            
                                if sheet.Tiltado then
                                return -5
                                end
            
                                if sheet.Frustrado then
                                return -2
                                end
            
                                end
            
                                return nil
                                end
            
                                chat:rolarDados("1d20 + " .. (sheet.C_ENC_Total or 0) .. (condition()
                                and (condition()) or ""),
                                self.Encantamentos.text,
                                function (rolado)
            
                                end);
        end);

    obj._e_event95 = obj.rectangle67:addEventListener("onClick",
        function (event)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
                                local chat = mesaDoPersonagem.chat
            
                                local function condition()
            
                                if self.Feiticos.text == "Acrobacia" or
                                self.Feiticos.text == "Atletismo" or
                                self.Feiticos.text == "Corpo-a-Corpo" or
                                self.Feiticos.text == "Furtividade" or
                                self.Feiticos.text == "Prestidigitação" or
                                self.Feiticos.text == "Veiculos Mágicos" or
                                self.Feiticos.text == "Iniciativa" or
                                self.Feiticos.text == "Aparar" or
                                self.Feiticos.text == "Fortitude" or
                                self.Feiticos.text == "Reflexo" or
                                self.Feiticos.text == "Resistencia" then
            
                                if sheet.Exausto then
                                return -5
                                end
            
                                if sheet.Fadigado then
                                return -2
                                end
            
                                else
            
                                if sheet.Tiltado then
                                return -5
                                end
            
                                if sheet.Frustrado then
                                return -2
                                end
            
                                end
            
                                return nil
                                end
            
                                chat:rolarDados("1d20 + " .. (sheet.C_FEI_Total or 0) .. (condition()
                                and (condition()) or ""),
                                self.Feiticos.text,
                                function (rolado)
            
                                end);
        end);

    obj._e_event96 = obj.rectangle68:addEventListener("onClick",
        function (event)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
                                local chat = mesaDoPersonagem.chat
            
                                local function condition()
            
                                if self.Herbologia.text == "Acrobacia" or
                                self.Herbologia.text == "Atletismo" or
                                self.Herbologia.text == "Corpo-a-Corpo" or
                                self.Herbologia.text == "Furtividade" or
                                self.Herbologia.text == "Prestidigitação" or
                                self.Herbologia.text == "Veiculos Mágicos" or
                                self.Herbologia.text == "Iniciativa" or
                                self.Herbologia.text == "Aparar" or
                                self.Herbologia.text == "Fortitude" or
                                self.Herbologia.text == "Reflexo" or
                                self.Herbologia.text == "Resistencia" then
            
                                if sheet.Exausto then
                                return -5
                                end
            
                                if sheet.Fadigado then
                                return -2
                                end
            
                                else
            
                                if sheet.Tiltado then
                                return -5
                                end
            
                                if sheet.Frustrado then
                                return -2
                                end
            
                                end
            
                                return nil
                                end
            
                                chat:rolarDados("1d20 + " .. (sheet.C_HER_Total or 0) .. (condition()
                                and (condition()) or ""),
                                self.Herbologia.text,
                                function (rolado)
            
                                end);
        end);

    obj._e_event97 = obj.rectangle69:addEventListener("onClick",
        function (event)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
                                local chat = mesaDoPersonagem.chat
            
                                local function condition()
            
                                if self.DCAT.text == "Acrobacia" or
                                self.DCAT.text == "Atletismo" or
                                self.DCAT.text == "Corpo-a-Corpo" or
                                self.DCAT.text == "Furtividade" or
                                self.DCAT.text == "Prestidigitação" or
                                self.DCAT.text == "Veiculos Mágicos" or
                                self.DCAT.text == "Iniciativa" or
                                self.DCAT.text == "Aparar" or
                                self.DCAT.text == "Fortitude" or
                                self.DCAT.text == "Reflexo" or
                                self.DCAT.text == "Resistencia" then
            
                                if sheet.Exausto then
                                return -5
                                end
            
                                if sheet.Fadigado then
                                return -2
                                end
            
                                else
            
                                if sheet.Tiltado then
                                return -5
                                end
            
                                if sheet.Frustrado then
                                return -2
                                end
            
                                end
            
                                return nil
                                end
            
                                chat:rolarDados("1d20 + " .. (sheet.C_MAL_Total or 0) .. (condition()
                                and (condition()) or ""),
                                self.DCAT.text,
                                function (rolado)
            
                                end);
        end);

    obj._e_event98 = obj.rectangle70:addEventListener("onClick",
        function (event)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
                                local chat = mesaDoPersonagem.chat
            
                                local function condition()
            
                                if self.Pocoes.text == "Acrobacia" or
                                self.Pocoes.text == "Atletismo" or
                                self.Pocoes.text == "Corpo-a-Corpo" or
                                self.Pocoes.text == "Furtividade" or
                                self.Pocoes.text == "Prestidigitação" or
                                self.Pocoes.text == "Veiculos Mágicos" or
                                self.Pocoes.text == "Iniciativa" or
                                self.Pocoes.text == "Aparar" or
                                self.Pocoes.text == "Fortitude" or
                                self.Pocoes.text == "Reflexo" or
                                self.Pocoes.text == "Resistencia" then
            
                                if sheet.Exausto then
                                return -5
                                end
            
                                if sheet.Fadigado then
                                return -2
                                end
            
                                else
            
                                if sheet.Tiltado then
                                return -5
                                end
            
                                if sheet.Frustrado then
                                return -2
                                end
            
                                end
            
                                return nil
                                end
            
                                chat:rolarDados("1d20 + " .. (sheet.C_POC_Total or 0) .. (condition()
                                and (condition()) or ""),
                                self.Pocoes.text,
                                function (rolado)
            
                                end);
        end);

    obj._e_event99 = obj.rectangle71:addEventListener("onClick",
        function (event)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
                                local chat = mesaDoPersonagem.chat
            
                                local function condition()
            
                                if self.Runas.text == "Acrobacia" or
                                self.Runas.text == "Atletismo" or
                                self.Runas.text == "Corpo-a-Corpo" or
                                self.Runas.text == "Furtividade" or
                                self.Runas.text == "Prestidigitação" or
                                self.Runas.text == "Veiculos Mágicos" or
                                self.Runas.text == "Iniciativa" or
                                self.Runas.text == "Aparar" or
                                self.Runas.text == "Fortitude" or
                                self.Runas.text == "Reflexo" or
                                self.Runas.text == "Resistencia" then
            
                                if sheet.Exausto then
                                return -5
                                end
            
                                if sheet.Fadigado then
                                return -2
                                end
            
                                else
            
                                if sheet.Tiltado then
                                return -5
                                end
            
                                if sheet.Frustrado then
                                return -2
                                end
            
                                end
            
                                return nil
                                end
            
                                chat:rolarDados("1d20 + " .. (sheet.C_RUN_Total or 0) .. (condition()
                                and (condition()) or ""),
                                self.Runas.text,
                                function (rolado)
            
                                end);
        end);

    obj._e_event100 = obj.rectangle72:addEventListener("onClick",
        function (event)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
                                local chat = mesaDoPersonagem.chat
            
                                local function condition()
            
                                if self.Transmutacao.text == "Acrobacia" or
                                self.Transmutacao.text == "Atletismo" or
                                self.Transmutacao.text == "Corpo-a-Corpo" or
                                self.Transmutacao.text == "Furtividade" or
                                self.Transmutacao.text == "Prestidigitação" or
                                self.Transmutacao.text == "Veiculos Mágicos" or
                                self.Transmutacao.text == "Iniciativa" or
                                self.Transmutacao.text == "Aparar" or
                                self.Transmutacao.text == "Fortitude" or
                                self.Transmutacao.text == "Reflexo" or
                                self.Transmutacao.text == "Resistencia" then
            
                                if sheet.Exausto then
                                return -5
                                end
            
                                if sheet.Fadigado then
                                return -2
                                end
            
                                else
            
                                if sheet.Tiltado then
                                return -5
                                end
            
                                if sheet.Frustrado then
                                return -2
                                end
            
                                end
            
                                return nil
                                end
            
                                chat:rolarDados("1d20 + " .. (sheet.C_TRA_Total or 0) .. (condition()
                                and (condition()) or ""),
                                self.Transmutacao.text,
                                function (rolado)
            
                                end);
        end);

    obj._e_event101 = obj.button28:addEventListener("onClick",
        function (event)
            self.outrasPericias_record:append();
        end);

    obj._e_event102 = obj.rectangle73:addEventListener("onClick",
        function (event)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
                                local chat = mesaDoPersonagem.chat
            
                                local function condition()
            
                                if self.Iniciativa.text == "Acrobacia" or
                                self.Iniciativa.text == "Atletismo" or
                                self.Iniciativa.text == "Corpo-a-Corpo" or
                                self.Iniciativa.text == "Furtividade" or
                                self.Iniciativa.text == "Prestidigitação" or
                                self.Iniciativa.text == "Veiculos Mágicos" or
                                self.Iniciativa.text == "Iniciativa" or
                                self.Iniciativa.text == "Aparar" or
                                self.Iniciativa.text == "Fortitude" or
                                self.Iniciativa.text == "Reflexo" or
                                self.Iniciativa.text == "Resistencia" then
            
                                if sheet.Exausto then
                                return -5
                                end
            
                                if sheet.Fadigado then
                                return -2
                                end
            
                                else
            
                                if sheet.Tiltado then
                                return -5
                                end
            
                                if sheet.Frustrado then
                                return -2
                                end
            
                                end
            
                                return nil
                                end
            
                                chat:rolarDados("1d20 + " .. (sheet.INI_Total or 0) .. (condition()
                                and (condition()) or ""),
                                self.Iniciativa.text,
                                function (rolado)
            
                                end);
        end);

    obj._e_event103 = obj.rectangle74:addEventListener("onClick",
        function (event)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
                                local chat = mesaDoPersonagem.chat
            
                                local function condition()
            
                                if self.Aparar.text == "Acrobacia" or
                                self.Aparar.text == "Atletismo" or
                                self.Aparar.text == "Corpo-a-Corpo" or
                                self.Aparar.text == "Furtividade" or
                                self.Aparar.text == "Prestidigitação" or
                                self.Aparar.text == "Veiculos Mágicos" or
                                self.Aparar.text == "Iniciativa" or
                                self.Aparar.text == "Aparar" or
                                self.Aparar.text == "Fortitude" or
                                self.Aparar.text == "Reflexo" or
                                self.Aparar.text == "Resistencia" then
            
                                if sheet.Exausto then
                                return -5
                                end
            
                                if sheet.Fadigado then
                                return -2
                                end
            
                                else
            
                                if sheet.Tiltado then
                                return -5
                                end
            
                                if sheet.Frustrado then
                                return -2
                                end
            
                                end
            
                                return nil
                                end
            
                                chat:rolarDados("1d20 + " .. (sheet.APA_Total or 0) .. (condition()
                                and (condition()) or ""),
                                self.Aparar.text,
                                function (rolado)
            
                                end);
        end);

    obj._e_event104 = obj.rectangle75:addEventListener("onClick",
        function (event)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
                                local chat = mesaDoPersonagem.chat
            
                                local function condition()
            
                                if self.Fortitude.text == "Acrobacia" or
                                self.Fortitude.text == "Atletismo" or
                                self.Fortitude.text == "Corpo-a-Corpo" or
                                self.Fortitude.text == "Furtividade" or
                                self.Fortitude.text == "Prestidigitação" or
                                self.Fortitude.text == "Veiculos Mágicos" or
                                self.Fortitude.text == "Iniciativa" or
                                self.Fortitude.text == "Aparar" or
                                self.Fortitude.text == "Fortitude" or
                                self.Fortitude.text == "Reflexo" or
                                self.Fortitude.text == "Resistencia" then
            
                                if sheet.Exausto then
                                return -5
                                end
            
                                if sheet.Fadigado then
                                return -2
                                end
            
                                else
            
                                if sheet.Tiltado then
                                return -5
                                end
            
                                if sheet.Frustrado then
                                return -2
                                end
            
                                end
            
                                return nil
                                end
            
                                chat:rolarDados("1d20 + " .. (sheet.FORT_Total or 0) .. (condition()
                                and (condition()) or ""),
                                self.Fortitude.text,
                                function (rolado)
            
                                end);
        end);

    obj._e_event105 = obj.rectangle76:addEventListener("onClick",
        function (event)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
                                local chat = mesaDoPersonagem.chat
            
                                local function condition()
            
                                if self.Reflexo.text == "Acrobacia" or
                                self.Reflexo.text == "Atletismo" or
                                self.Reflexo.text == "Corpo-a-Corpo" or
                                self.Reflexo.text == "Furtividade" or
                                self.Reflexo.text == "Prestidigitação" or
                                self.Reflexo.text == "Veiculos Mágicos" or
                                self.Reflexo.text == "Iniciativa" or
                                self.Reflexo.text == "Aparar" or
                                self.Reflexo.text == "Fortitude" or
                                self.Reflexo.text == "Reflexo" or
                                self.Reflexo.text == "Resistencia" then
            
                                if sheet.Exausto then
                                return -5
                                end
            
                                if sheet.Fadigado then
                                return -2
                                end
            
                                else
            
                                if sheet.Tiltado then
                                return -5
                                end
            
                                if sheet.Frustrado then
                                return -2
                                end
            
                                end
            
                                return nil
                                end
            
                                chat:rolarDados("1d20 + " .. (sheet.REF_Total or 0) .. (condition()
                                and (condition()) or ""),
                                self.Reflexo.text,
                                function (rolado)
            
                                end);
        end);

    obj._e_event106 = obj.rectangle77:addEventListener("onClick",
        function (event)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
                                local chat = mesaDoPersonagem.chat
            
                                local function condition()
            
                                if self.Resistencia.text == "Acrobacia" or
                                self.Resistencia.text == "Atletismo" or
                                self.Resistencia.text == "Corpo-a-Corpo" or
                                self.Resistencia.text == "Furtividade" or
                                self.Resistencia.text == "Prestidigitação" or
                                self.Resistencia.text == "Veiculos Mágicos" or
                                self.Resistencia.text == "Iniciativa" or
                                self.Resistencia.text == "Aparar" or
                                self.Resistencia.text == "Fortitude" or
                                self.Resistencia.text == "Reflexo" or
                                self.Resistencia.text == "Resistencia" then
            
                                if sheet.Exausto then
                                return -5
                                end
            
                                if sheet.Fadigado then
                                return -2
                                end
            
                                else
            
                                if sheet.Tiltado then
                                return -5
                                end
            
                                if sheet.Frustrado then
                                return -2
                                end
            
                                end
            
                                return nil
                                end
            
                                chat:rolarDados("1d20 + " .. (sheet.RES_Total or 0) .. (condition()
                                and (condition()) or ""),
                                self.Resistencia.text,
                                function (rolado)
            
                                end);
        end);

    obj._e_event107 = obj.rectangle78:addEventListener("onClick",
        function (event)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
                                local chat = mesaDoPersonagem.chat
            
                                local function condition()
            
                                if self.Vontade.text == "Acrobacia" or
                                self.Vontade.text == "Atletismo" or
                                self.Vontade.text == "Corpo-a-Corpo" or
                                self.Vontade.text == "Furtividade" or
                                self.Vontade.text == "Prestidigitação" or
                                self.Vontade.text == "Veiculos Mágicos" or
                                self.Vontade.text == "Iniciativa" or
                                self.Vontade.text == "Aparar" or
                                self.Vontade.text == "Fortitude" or
                                self.Vontade.text == "Reflexo" or
                                self.Vontade.text == "Resistencia" then
            
                                if sheet.Exausto then
                                return -5
                                end
            
                                if sheet.Fadigado then
                                return -2
                                end
            
                                else
            
                                if sheet.Tiltado then
                                return -5
                                end
            
                                if sheet.Frustrado then
                                return -2
                                end
            
                                end
            
                                return nil
                                end
            
                                chat:rolarDados("1d20 + " .. (sheet.VON_Total or 0) .. (condition()
                                and (condition()) or ""),
                                self.Vontade.text,
                                function (rolado)
            
                                end);
        end);

    obj._e_event108 = obj.button29:addEventListener("onClick",
        function (event)
            self.kekzin:append();
        end);

    obj._e_event109 = obj.button30:addEventListener("onClick",
        function (event)
            ListaDeFeiticoParaTreino()
        end);

    obj._e_event110 = obj.button31:addEventListener("onClick",
        function (event)
            rolarCorpo()
        end);

    obj._e_event111 = obj.button32:addEventListener("onClick",
        function (event)
            rolarMente()
        end);

    obj._e_event112 = obj.rectangle83:addEventListener("onClick",
        function (event)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
                                local chat = mesaDoPersonagem.chat
            
                                local function condition()
            
                                if self.ANTE_QUAD.text == "Antecipar" or
                                self.ANTE_QUAD.text == "Atrapalhar" or
                                self.ANTE_QUAD.text == "Marcar Falta" then
            
                                if sheet.Tiltado then
                                return -5
                                end
            
                                if sheet.Frustrado then
                                return -2
                                end
            
                                else
            
                                if sheet.Exausto then
                                return -5
                                end
            
                                if sheet.Fadigado then
                                return -2
                                end
            
                                end
            
                                return nil
                                end
            
                                chat:rolarDados("1d20 + " .. (sheet.ANTE_QUAD_TOTAL or 0) .. (condition() and
                                (condition()) or ""),
                                self.ANTE_QUAD.text,
                                function (rolado)
            
                                end);
        end);

    obj._e_event113 = obj.rectangle84:addEventListener("onClick",
        function (event)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
                                local chat = mesaDoPersonagem.chat
            
                                local function condition()
            
                                if self.APAN_QUAD.text == "Antecipar" or
                                self.APAN_QUAD.text == "Atrapalhar" or
                                self.APAN_QUAD.text == "Marcar Falta" then
            
                                if sheet.Tiltado then
                                return -5
                                end
            
                                if sheet.Frustrado then
                                return -2
                                end
            
                                else
            
                                if sheet.Exausto then
                                return -5
                                end
            
                                if sheet.Fadigado then
                                return -2
                                end
            
                                end
            
                                return nil
                                end
            
                                chat:rolarDados("1d20 + " .. (sheet.APAN_QUAD_TOTAL or 0) .. (condition() and
                                (condition()) or ""),
                                self.APAN_QUAD.text,
                                function (rolado)
            
                                end);
        end);

    obj._e_event114 = obj.rectangle85:addEventListener("onClick",
        function (event)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
                                local chat = mesaDoPersonagem.chat
            
                                local function condition()
            
                                if self.ATRA_QUAD.text == "Antecipar" or
                                self.ATRA_QUAD.text == "Atrapalhar" or
                                self.ATRA_QUAD.text == "Marcar Falta" then
            
                                if sheet.Tiltado then
                                return -5
                                end
            
                                if sheet.Frustrado then
                                return -2
                                end
            
                                else
            
                                if sheet.Exausto then
                                return -5
                                end
            
                                if sheet.Fadigado then
                                return -2
                                end
            
                                end
            
                                return nil
                                end
            
                                chat:rolarDados("1d20 + " .. (sheet.ATRA_QUAD_TOTAL or 0) .. (condition() and
                                (condition()) or ""),
                                self.ATRA_QUAD.text,
                                function (rolado)
            
                                end);
        end);

    obj._e_event115 = obj.rectangle86:addEventListener("onClick",
        function (event)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
                                local chat = mesaDoPersonagem.chat
            
                                local function condition()
            
                                if self.DEFE_QUAD.text == "Antecipar" or
                                self.DEFE_QUAD.text == "Atrapalhar" or
                                self.DEFE_QUAD.text == "Marcar Falta" then
            
                                if sheet.Tiltado then
                                return -5
                                end
            
                                if sheet.Frustrado then
                                return -2
                                end
            
                                else
            
                                if sheet.Exausto then
                                return -5
                                end
            
                                if sheet.Fadigado then
                                return -2
                                end
            
                                end
            
                                return nil
                                end
            
                                chat:rolarDados("1d20 + " .. (sheet.DEFE_QUAD_TOTAL or 0) .. (condition() and
                                (condition()) or ""),
                                self.DEFE_QUAD.text,
                                function (rolado)
            
                                end);
        end);

    obj._e_event116 = obj.rectangle87:addEventListener("onClick",
        function (event)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
                                local chat = mesaDoPersonagem.chat
            
                                local function condition()
            
                                if self.DRI_QUAD.text == "Antecipar" or
                                self.DRI_QUAD.text == "Atrapalhar" or
                                self.DRI_QUAD.text == "Marcar Falta" then
            
                                if sheet.Tiltado then
                                return -5
                                end
            
                                if sheet.Frustrado then
                                return -2
                                end
            
                                else
            
                                if sheet.Exausto then
                                return -5
                                end
            
                                if sheet.Fadigado then
                                return -2
                                end
            
                                end
            
                                return nil
                                end
            
                                chat:rolarDados("1d20 + " .. (sheet.DRI_QUAD_TOTAL or 0) .. (condition() and
                                (condition()) or ""),
                                self.DRI_QUAD.text,
                                function (rolado)
            
                                end);
        end);

    obj._e_event117 = obj.rectangle88:addEventListener("onClick",
        function (event)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
                                local chat = mesaDoPersonagem.chat
            
                                local function condition()
            
                                if self.GOL_QUAD.text == "Antecipar" or
                                self.GOL_QUAD.text == "Atrapalhar" or
                                self.GOL_QUAD.text == "Marcar Falta" then
            
                                if sheet.Tiltado then
                                return -5
                                end
            
                                if sheet.Frustrado then
                                return -2
                                end
            
                                else
            
                                if sheet.Exausto then
                                return -5
                                end
            
                                if sheet.Fadigado then
                                return -2
                                end
            
                                end
            
                                return nil
                                end
            
                                chat:rolarDados("1d20 + " .. (sheet.GOL_QUAD_TOTAL or 0) .. (condition() and
                                (condition()) or ""),
                                self.GOL_QUAD.text,
                                function (rolado)
            
                                end);
        end);

    obj._e_event118 = obj.rectangle89:addEventListener("onClick",
        function (event)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
                                local chat = mesaDoPersonagem.chat
            
                                local function condition()
            
                                if self.FALTA_QUAD.text == "Antecipar" or
                                self.FALTA_QUAD.text == "Atrapalhar" or
                                self.FALTA_QUAD.text == "Marcar Falta" then
            
                                if sheet.Tiltado then
                                return -5
                                end
            
                                if sheet.Frustrado then
                                return -2
                                end
            
                                else
            
                                if sheet.Exausto then
                                return -5
                                end
            
                                if sheet.Fadigado then
                                return -2
                                end
            
                                end
            
                                return nil
                                end
            
                                chat:rolarDados("1d20 + " .. (sheet.FALTA_QUAD_TOTAL or 0) .. (condition() and
                                (condition()) or ""),
                                self.FALTA_QUAD.text,
                                function (rolado)
            
                                end);
        end);

    obj._e_event119 = obj.rectangle90:addEventListener("onClick",
        function (event)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
                                local chat = mesaDoPersonagem.chat
            
                                local function condition()
            
                                if self.PASS_QUAD.text == "Antecipar" or
                                self.PASS_QUAD.text == "Atrapalhar" or
                                self.PASS_QUAD.text == "Marcar Falta" then
            
                                if sheet.Tiltado then
                                return -5
                                end
            
                                if sheet.Frustrado then
                                return -2
                                end
            
                                else
            
                                if sheet.Exausto then
                                return -5
                                end
            
                                if sheet.Fadigado then
                                return -2
                                end
            
                                end
            
                                return nil
                                end
            
                                chat:rolarDados("1d20 + " .. (sheet.PASS_QUAD_TOTAL or 0) .. (condition() and
                                (condition()) or ""),
                                self.PASS_QUAD.text,
                                function (rolado)
            
                                end);
        end);

    obj._e_event120 = obj.rectangle91:addEventListener("onClick",
        function (event)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
                                local chat = mesaDoPersonagem.chat
            
                                local function condition()
            
                                if self.REBA_QUAD.text == "Antecipar" or
                                self.REBA_QUAD.text == "Atrapalhar" or
                                self.REBA_QUAD.text == "Marcar Falta" then
            
                                if sheet.Tiltado then
                                return -5
                                end
            
                                if sheet.Frustrado then
                                return -2
                                end
            
                                else
            
                                if sheet.Exausto then
                                return -5
                                end
            
                                if sheet.Fadigado then
                                return -2
                                end
            
                                end
            
                                return nil
                                end
            
                                chat:rolarDados("1d20 + " .. (sheet.REBA_QUAD_TOTAL or 0) .. (condition() and
                                (condition()) or ""),
                                self.REBA_QUAD.text,
                                function (rolado)
            
                                end);
        end);

    obj._e_event121 = obj.rectangle92:addEventListener("onClick",
        function (event)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
                                local chat = mesaDoPersonagem.chat
            
                                local function condition()
            
                                if self.ROU_QUAD.text == "Antecipar" or
                                self.ROU_QUAD.text == "Atrapalhar" or
                                self.ROU_QUAD.text == "Marcar Falta" then
            
                                if sheet.Tiltado then
                                return -5
                                end
            
                                if sheet.Frustrado then
                                return -2
                                end
            
                                else
            
                                if sheet.Exausto then
                                return -5
                                end
            
                                if sheet.Fadigado then
                                return -2
                                end
            
                                end
            
                                return nil
                                end
            
                                chat:rolarDados("1d20 + " .. (sheet.ROU_QUAD_TOTAL or 0) .. (condition() and
                                (condition()) or ""),
                                self.ROU_QUAD.text,
                                function (rolado)
            
                                end);
        end);

    obj._e_event122 = obj.rectangle93:addEventListener("onClick",
        function (event)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
                                local chat = mesaDoPersonagem.chat
            
                                local function condition()
            
                                if self.VEL_QUAD.text == "Antecipar" or
                                self.VEL_QUAD.text == "Atrapalhar" or
                                self.VEL_QUAD.text == "Marcar Falta" then
            
                                if sheet.Tiltado then
                                return -5
                                end
            
                                if sheet.Frustrado then
                                return -2
                                end
            
                                else
            
                                if sheet.Exausto then
                                return -5
                                end
            
                                if sheet.Fadigado then
                                return -2
                                end
            
                                end
            
                                return nil
                                end
            
                                chat:rolarDados("1d20 + " .. (sheet.VEL_QUAD_TOTAL or 0) .. (condition() and
                                (condition()) or ""),
                                self.VEL_QUAD.text,
                                function (rolado)
            
                                end);
        end);

    function obj:_releaseEvents()
        __o_rrpgObjs.removeEventListenerById(self._e_event122);
        __o_rrpgObjs.removeEventListenerById(self._e_event121);
        __o_rrpgObjs.removeEventListenerById(self._e_event120);
        __o_rrpgObjs.removeEventListenerById(self._e_event119);
        __o_rrpgObjs.removeEventListenerById(self._e_event118);
        __o_rrpgObjs.removeEventListenerById(self._e_event117);
        __o_rrpgObjs.removeEventListenerById(self._e_event116);
        __o_rrpgObjs.removeEventListenerById(self._e_event115);
        __o_rrpgObjs.removeEventListenerById(self._e_event114);
        __o_rrpgObjs.removeEventListenerById(self._e_event113);
        __o_rrpgObjs.removeEventListenerById(self._e_event112);
        __o_rrpgObjs.removeEventListenerById(self._e_event111);
        __o_rrpgObjs.removeEventListenerById(self._e_event110);
        __o_rrpgObjs.removeEventListenerById(self._e_event109);
        __o_rrpgObjs.removeEventListenerById(self._e_event108);
        __o_rrpgObjs.removeEventListenerById(self._e_event107);
        __o_rrpgObjs.removeEventListenerById(self._e_event106);
        __o_rrpgObjs.removeEventListenerById(self._e_event105);
        __o_rrpgObjs.removeEventListenerById(self._e_event104);
        __o_rrpgObjs.removeEventListenerById(self._e_event103);
        __o_rrpgObjs.removeEventListenerById(self._e_event102);
        __o_rrpgObjs.removeEventListenerById(self._e_event101);
        __o_rrpgObjs.removeEventListenerById(self._e_event100);
        __o_rrpgObjs.removeEventListenerById(self._e_event99);
        __o_rrpgObjs.removeEventListenerById(self._e_event98);
        __o_rrpgObjs.removeEventListenerById(self._e_event97);
        __o_rrpgObjs.removeEventListenerById(self._e_event96);
        __o_rrpgObjs.removeEventListenerById(self._e_event95);
        __o_rrpgObjs.removeEventListenerById(self._e_event94);
        __o_rrpgObjs.removeEventListenerById(self._e_event93);
        __o_rrpgObjs.removeEventListenerById(self._e_event92);
        __o_rrpgObjs.removeEventListenerById(self._e_event91);
        __o_rrpgObjs.removeEventListenerById(self._e_event90);
        __o_rrpgObjs.removeEventListenerById(self._e_event89);
        __o_rrpgObjs.removeEventListenerById(self._e_event88);
        __o_rrpgObjs.removeEventListenerById(self._e_event87);
        __o_rrpgObjs.removeEventListenerById(self._e_event86);
        __o_rrpgObjs.removeEventListenerById(self._e_event85);
        __o_rrpgObjs.removeEventListenerById(self._e_event84);
        __o_rrpgObjs.removeEventListenerById(self._e_event83);
        __o_rrpgObjs.removeEventListenerById(self._e_event82);
        __o_rrpgObjs.removeEventListenerById(self._e_event81);
        __o_rrpgObjs.removeEventListenerById(self._e_event80);
        __o_rrpgObjs.removeEventListenerById(self._e_event79);
        __o_rrpgObjs.removeEventListenerById(self._e_event78);
        __o_rrpgObjs.removeEventListenerById(self._e_event77);
        __o_rrpgObjs.removeEventListenerById(self._e_event76);
        __o_rrpgObjs.removeEventListenerById(self._e_event75);
        __o_rrpgObjs.removeEventListenerById(self._e_event74);
        __o_rrpgObjs.removeEventListenerById(self._e_event73);
        __o_rrpgObjs.removeEventListenerById(self._e_event72);
        __o_rrpgObjs.removeEventListenerById(self._e_event71);
        __o_rrpgObjs.removeEventListenerById(self._e_event70);
        __o_rrpgObjs.removeEventListenerById(self._e_event69);
        __o_rrpgObjs.removeEventListenerById(self._e_event68);
        __o_rrpgObjs.removeEventListenerById(self._e_event67);
        __o_rrpgObjs.removeEventListenerById(self._e_event66);
        __o_rrpgObjs.removeEventListenerById(self._e_event65);
        __o_rrpgObjs.removeEventListenerById(self._e_event64);
        __o_rrpgObjs.removeEventListenerById(self._e_event63);
        __o_rrpgObjs.removeEventListenerById(self._e_event62);
        __o_rrpgObjs.removeEventListenerById(self._e_event61);
        __o_rrpgObjs.removeEventListenerById(self._e_event60);
        __o_rrpgObjs.removeEventListenerById(self._e_event59);
        __o_rrpgObjs.removeEventListenerById(self._e_event58);
        __o_rrpgObjs.removeEventListenerById(self._e_event57);
        __o_rrpgObjs.removeEventListenerById(self._e_event56);
        __o_rrpgObjs.removeEventListenerById(self._e_event55);
        __o_rrpgObjs.removeEventListenerById(self._e_event54);
        __o_rrpgObjs.removeEventListenerById(self._e_event53);
        __o_rrpgObjs.removeEventListenerById(self._e_event52);
        __o_rrpgObjs.removeEventListenerById(self._e_event51);
        __o_rrpgObjs.removeEventListenerById(self._e_event50);
        __o_rrpgObjs.removeEventListenerById(self._e_event49);
        __o_rrpgObjs.removeEventListenerById(self._e_event48);
        __o_rrpgObjs.removeEventListenerById(self._e_event47);
        __o_rrpgObjs.removeEventListenerById(self._e_event46);
        __o_rrpgObjs.removeEventListenerById(self._e_event45);
        __o_rrpgObjs.removeEventListenerById(self._e_event44);
        __o_rrpgObjs.removeEventListenerById(self._e_event43);
        __o_rrpgObjs.removeEventListenerById(self._e_event42);
        __o_rrpgObjs.removeEventListenerById(self._e_event41);
        __o_rrpgObjs.removeEventListenerById(self._e_event40);
        __o_rrpgObjs.removeEventListenerById(self._e_event39);
        __o_rrpgObjs.removeEventListenerById(self._e_event38);
        __o_rrpgObjs.removeEventListenerById(self._e_event37);
        __o_rrpgObjs.removeEventListenerById(self._e_event36);
        __o_rrpgObjs.removeEventListenerById(self._e_event35);
        __o_rrpgObjs.removeEventListenerById(self._e_event34);
        __o_rrpgObjs.removeEventListenerById(self._e_event33);
        __o_rrpgObjs.removeEventListenerById(self._e_event32);
        __o_rrpgObjs.removeEventListenerById(self._e_event31);
        __o_rrpgObjs.removeEventListenerById(self._e_event30);
        __o_rrpgObjs.removeEventListenerById(self._e_event29);
        __o_rrpgObjs.removeEventListenerById(self._e_event28);
        __o_rrpgObjs.removeEventListenerById(self._e_event27);
        __o_rrpgObjs.removeEventListenerById(self._e_event26);
        __o_rrpgObjs.removeEventListenerById(self._e_event25);
        __o_rrpgObjs.removeEventListenerById(self._e_event24);
        __o_rrpgObjs.removeEventListenerById(self._e_event23);
        __o_rrpgObjs.removeEventListenerById(self._e_event22);
        __o_rrpgObjs.removeEventListenerById(self._e_event21);
        __o_rrpgObjs.removeEventListenerById(self._e_event20);
        __o_rrpgObjs.removeEventListenerById(self._e_event19);
        __o_rrpgObjs.removeEventListenerById(self._e_event18);
        __o_rrpgObjs.removeEventListenerById(self._e_event17);
        __o_rrpgObjs.removeEventListenerById(self._e_event16);
        __o_rrpgObjs.removeEventListenerById(self._e_event15);
        __o_rrpgObjs.removeEventListenerById(self._e_event14);
        __o_rrpgObjs.removeEventListenerById(self._e_event13);
        __o_rrpgObjs.removeEventListenerById(self._e_event12);
        __o_rrpgObjs.removeEventListenerById(self._e_event11);
        __o_rrpgObjs.removeEventListenerById(self._e_event10);
        __o_rrpgObjs.removeEventListenerById(self._e_event9);
        __o_rrpgObjs.removeEventListenerById(self._e_event8);
        __o_rrpgObjs.removeEventListenerById(self._e_event7);
        __o_rrpgObjs.removeEventListenerById(self._e_event6);
        __o_rrpgObjs.removeEventListenerById(self._e_event5);
        __o_rrpgObjs.removeEventListenerById(self._e_event4);
        __o_rrpgObjs.removeEventListenerById(self._e_event3);
        __o_rrpgObjs.removeEventListenerById(self._e_event2);
        __o_rrpgObjs.removeEventListenerById(self._e_event1);
        __o_rrpgObjs.removeEventListenerById(self._e_event0);
    end;

    obj._oldLFMDestroy = obj.destroy;

    function obj:destroy() 
        self:_releaseEvents();

        if (self.handle ~= 0) and (self.setNodeDatabase ~= nil) then
          self:setNodeDatabase(nil);
        end;

        if self.Bonus ~= nil then self.Bonus:destroy(); self.Bonus = nil; end;
        if self.edit77 ~= nil then self.edit77:destroy(); self.edit77 = nil; end;
        if self.CD ~= nil then self.CD:destroy(); self.CD = nil; end;
        if self.edit47 ~= nil then self.edit47:destroy(); self.edit47 = nil; end;
        if self.edit90 ~= nil then self.edit90:destroy(); self.edit90 = nil; end;
        if self.kekzin ~= nil then self.kekzin:destroy(); self.kekzin = nil; end;
        if self.edit200 ~= nil then self.edit200:destroy(); self.edit200 = nil; end;
        if self.edit216 ~= nil then self.edit216:destroy(); self.edit216 = nil; end;
        if self.edit119 ~= nil then self.edit119:destroy(); self.edit119 = nil; end;
        if self.edit154 ~= nil then self.edit154:destroy(); self.edit154 = nil; end;
        if self.edit166 ~= nil then self.edit166:destroy(); self.edit166 = nil; end;
        if self.label91 ~= nil then self.label91:destroy(); self.label91 = nil; end;
        if self.label112 ~= nil then self.label112:destroy(); self.label112 = nil; end;
        if self.edit95 ~= nil then self.edit95:destroy(); self.edit95 = nil; end;
        if self.edit70 ~= nil then self.edit70:destroy(); self.edit70 = nil; end;
        if self.edit42 ~= nil then self.edit42:destroy(); self.edit42 = nil; end;
        if self.rectangle85 ~= nil then self.rectangle85:destroy(); self.rectangle85 = nil; end;
        if self.ROU_QUAD ~= nil then self.ROU_QUAD:destroy(); self.ROU_QUAD = nil; end;
        if self.rectangle71 ~= nil then self.rectangle71:destroy(); self.rectangle71 = nil; end;
        if self.edit163 ~= nil then self.edit163:destroy(); self.edit163 = nil; end;
        if self.edit153 ~= nil then self.edit153:destroy(); self.edit153 = nil; end;
        if self.label115 ~= nil then self.label115:destroy(); self.label115 = nil; end;
        if self.layout70 ~= nil then self.layout70:destroy(); self.layout70 = nil; end;
        if self.SABEDORIA ~= nil then self.SABEDORIA:destroy(); self.SABEDORIA = nil; end;
        if self.checkBox4 ~= nil then self.checkBox4:destroy(); self.checkBox4 = nil; end;
        if self.rectangle82 ~= nil then self.rectangle82:destroy(); self.rectangle82 = nil; end;
        if self.edit49 ~= nil then self.edit49:destroy(); self.edit49 = nil; end;
        if self.rectangle90 ~= nil then self.rectangle90:destroy(); self.rectangle90 = nil; end;
        if self.Intuicao ~= nil then self.Intuicao:destroy(); self.Intuicao = nil; end;
        if self.rectangle37 ~= nil then self.rectangle37:destroy(); self.rectangle37 = nil; end;
        if self.rectangle74 ~= nil then self.rectangle74:destroy(); self.rectangle74 = nil; end;
        if self.label67 ~= nil then self.label67:destroy(); self.label67 = nil; end;
        if self.Enganacao ~= nil then self.Enganacao:destroy(); self.Enganacao = nil; end;
        if self.edit27 ~= nil then self.edit27:destroy(); self.edit27 = nil; end;
        if self.layout75 ~= nil then self.layout75:destroy(); self.layout75 = nil; end;
        if self.Atualidades ~= nil then self.Atualidades:destroy(); self.Atualidades = nil; end;
        if self.checkBox1 ~= nil then self.checkBox1:destroy(); self.checkBox1 = nil; end;
        if self.label118 ~= nil then self.label118:destroy(); self.label118 = nil; end;
        if self.layout111 ~= nil then self.layout111:destroy(); self.layout111 = nil; end;
        if self.rectangle32 ~= nil then self.rectangle32:destroy(); self.rectangle32 = nil; end;
        if self.APAN_QUAD ~= nil then self.APAN_QUAD:destroy(); self.APAN_QUAD = nil; end;
        if self.label62 ~= nil then self.label62:destroy(); self.label62 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.edit108 ~= nil then self.edit108:destroy(); self.edit108 = nil; end;
        if self.edit65 ~= nil then self.edit65:destroy(); self.edit65 = nil; end;
        if self.layout37 ~= nil then self.layout37:destroy(); self.layout37 = nil; end;
        if self.VeiculosMagicos ~= nil then self.VeiculosMagicos:destroy(); self.VeiculosMagicos = nil; end;
        if self.Concentracao ~= nil then self.Concentracao:destroy(); self.Concentracao = nil; end;
        if self.tab11 ~= nil then self.tab11:destroy(); self.tab11 = nil; end;
        if self.edit176 ~= nil then self.edit176:destroy(); self.edit176 = nil; end;
        if self.layout59 ~= nil then self.layout59:destroy(); self.layout59 = nil; end;
        if self.label69 ~= nil then self.label69:destroy(); self.label69 = nil; end;
        if self.edit60 ~= nil then self.edit60:destroy(); self.edit60 = nil; end;
        if self.tab14 ~= nil then self.tab14:destroy(); self.tab14 = nil; end;
        if self.DEFE_QUAD ~= nil then self.DEFE_QUAD:destroy(); self.DEFE_QUAD = nil; end;
        if self.ANTE_QUAD ~= nil then self.ANTE_QUAD:destroy(); self.ANTE_QUAD = nil; end;
        if self.edit171 ~= nil then self.edit171:destroy(); self.edit171 = nil; end;
        if self.rectangle38 ~= nil then self.rectangle38:destroy(); self.rectangle38 = nil; end;
        if self.layout52 ~= nil then self.layout52:destroy(); self.layout52 = nil; end;
        if self.label39 ~= nil then self.label39:destroy(); self.label39 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.button8 ~= nil then self.button8:destroy(); self.button8 = nil; end;
        if self.layout60 ~= nil then self.layout60:destroy(); self.layout60 = nil; end;
        if self.Furtividade ~= nil then self.Furtividade:destroy(); self.Furtividade = nil; end;
        if self.edit102 ~= nil then self.edit102:destroy(); self.edit102 = nil; end;
        if self.label45 ~= nil then self.label45:destroy(); self.label45 = nil; end;
        if self.tab1 ~= nil then self.tab1:destroy(); self.tab1 = nil; end;
        if self.layout57 ~= nil then self.layout57:destroy(); self.layout57 = nil; end;
        if self.layout18 ~= nil then self.layout18:destroy(); self.layout18 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.layout67 ~= nil then self.layout67:destroy(); self.layout67 = nil; end;
        if self.edit107 ~= nil then self.edit107:destroy(); self.edit107 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.label40 ~= nil then self.label40:destroy(); self.label40 = nil; end;
        if self.label128 ~= nil then self.label128:destroy(); self.label128 = nil; end;
        if self.rectangle63 ~= nil then self.rectangle63:destroy(); self.rectangle63 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.layout15 ~= nil then self.layout15:destroy(); self.layout15 = nil; end;
        if self.button18 ~= nil then self.button18:destroy(); self.button18 = nil; end;
        if self.button6 ~= nil then self.button6:destroy(); self.button6 = nil; end;
        if self.label33 ~= nil then self.label33:destroy(); self.label33 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.rectangle49 ~= nil then self.rectangle49:destroy(); self.rectangle49 = nil; end;
        if self.rectangle64 ~= nil then self.rectangle64:destroy(); self.rectangle64 = nil; end;
        if self.button21 ~= nil then self.button21:destroy(); self.button21 = nil; end;
        if self.edit31 ~= nil then self.edit31:destroy(); self.edit31 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.layout42 ~= nil then self.layout42:destroy(); self.layout42 = nil; end;
        if self.edit120 ~= nil then self.edit120:destroy(); self.edit120 = nil; end;
        if self.Frustrado ~= nil then self.Frustrado:destroy(); self.Frustrado = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.button16 ~= nil then self.button16:destroy(); self.button16 = nil; end;
        if self.button24 ~= nil then self.button24:destroy(); self.button24 = nil; end;
        if self.label122 ~= nil then self.label122:destroy(); self.label122 = nil; end;
        if self.rclFeiticos ~= nil then self.rclFeiticos:destroy(); self.rclFeiticos = nil; end;
        if self.edit198 ~= nil then self.edit198:destroy(); self.edit198 = nil; end;
        if self.richEdit1 ~= nil then self.richEdit1:destroy(); self.richEdit1 = nil; end;
        if self.rectangle43 ~= nil then self.rectangle43:destroy(); self.rectangle43 = nil; end;
        if self.layout45 ~= nil then self.layout45:destroy(); self.layout45 = nil; end;
        if self.tipo ~= nil then self.tipo:destroy(); self.tipo = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.edit125 ~= nil then self.edit125:destroy(); self.edit125 = nil; end;
        if self.label81 ~= nil then self.label81:destroy(); self.label81 = nil; end;
        if self.label127 ~= nil then self.label127:destroy(); self.label127 = nil; end;
        if self.edit85 ~= nil then self.edit85:destroy(); self.edit85 = nil; end;
        if self.richEdit4 ~= nil then self.richEdit4:destroy(); self.richEdit4 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.rectangle8 ~= nil then self.rectangle8:destroy(); self.rectangle8 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.label25 ~= nil then self.label25:destroy(); self.label25 = nil; end;
        if self.layout48 ~= nil then self.layout48:destroy(); self.layout48 = nil; end;
        if self.label84 ~= nil then self.label84:destroy(); self.label84 = nil; end;
        if self.edit184 ~= nil then self.edit184:destroy(); self.edit184 = nil; end;
        if self.edit192 ~= nil then self.edit192:destroy(); self.edit192 = nil; end;
        if self.edit149 ~= nil then self.edit149:destroy(); self.edit149 = nil; end;
        if self.layout88 ~= nil then self.layout88:destroy(); self.layout88 = nil; end;
        if self.layout96 ~= nil then self.layout96:destroy(); self.layout96 = nil; end;
        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
        if self.label28 ~= nil then self.label28:destroy(); self.label28 = nil; end;
        if self.edit57 ~= nil then self.edit57:destroy(); self.edit57 = nil; end;
        if self.label57 ~= nil then self.label57:destroy(); self.label57 = nil; end;
        if self.Fortitude ~= nil then self.Fortitude:destroy(); self.Fortitude = nil; end;
        if self.edit189 ~= nil then self.edit189:destroy(); self.edit189 = nil; end;
        if self.layout24 ~= nil then self.layout24:destroy(); self.layout24 = nil; end;
        if self.edit146 ~= nil then self.edit146:destroy(); self.edit146 = nil; end;
        if self.edit130 ~= nil then self.edit130:destroy(); self.edit130 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.layout83 ~= nil then self.layout83:destroy(); self.layout83 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.label50 ~= nil then self.label50:destroy(); self.label50 = nil; end;
        if self.label100 ~= nil then self.label100:destroy(); self.label100 = nil; end;
        if self.layout93 ~= nil then self.layout93:destroy(); self.layout93 = nil; end;
        if self.label132 ~= nil then self.label132:destroy(); self.label132 = nil; end;
        if self.rectangle55 ~= nil then self.rectangle55:destroy(); self.rectangle55 = nil; end;
        if self.layout23 ~= nil then self.layout23:destroy(); self.layout23 = nil; end;
        if self.edit143 ~= nil then self.edit143:destroy(); self.edit143 = nil; end;
        if self.label105 ~= nil then self.label105:destroy(); self.label105 = nil; end;
        if self.layout104 ~= nil then self.layout104:destroy(); self.layout104 = nil; end;
        if self.edit208 ~= nil then self.edit208:destroy(); self.edit208 = nil; end;
        if self.edit111 ~= nil then self.edit111:destroy(); self.edit111 = nil; end;
        if self.rectangle27 ~= nil then self.rectangle27:destroy(); self.rectangle27 = nil; end;
        if self.rectangle17 ~= nil then self.rectangle17:destroy(); self.rectangle17 = nil; end;
        if self.rectangle58 ~= nil then self.rectangle58:destroy(); self.rectangle58 = nil; end;
        if self.label77 ~= nil then self.label77:destroy(); self.label77 = nil; end;
        if self.edit78 ~= nil then self.edit78:destroy(); self.edit78 = nil; end;
        if self.layout99 ~= nil then self.layout99:destroy(); self.layout99 = nil; end;
        if self.layout101 ~= nil then self.layout101:destroy(); self.layout101 = nil; end;
        if self.edit203 ~= nil then self.edit203:destroy(); self.edit203 = nil; end;
        if self.edit213 ~= nil then self.edit213:destroy(); self.edit213 = nil; end;
        if self.edit114 ~= nil then self.edit114:destroy(); self.edit114 = nil; end;
        if self.rectangle20 ~= nil then self.rectangle20:destroy(); self.rectangle20 = nil; end;
        if self.rectangle12 ~= nil then self.rectangle12:destroy(); self.rectangle12 = nil; end;
        if self.layout78 ~= nil then self.layout78:destroy(); self.layout78 = nil; end;
        if self.label92 ~= nil then self.label92:destroy(); self.label92 = nil; end;
        if self.edit92 ~= nil then self.edit92:destroy(); self.edit92 = nil; end;
        if self.edit75 ~= nil then self.edit75:destroy(); self.edit75 = nil; end;
        if self.edit41 ~= nil then self.edit41:destroy(); self.edit41 = nil; end;
        if self.Atletismo ~= nil then self.Atletismo:destroy(); self.Atletismo = nil; end;
        if self.edit206 ~= nil then self.edit206:destroy(); self.edit206 = nil; end;
        if self.edit214 ~= nil then self.edit214:destroy(); self.edit214 = nil; end;
        if self.edit164 ~= nil then self.edit164:destroy(); self.edit164 = nil; end;
        if self.edit156 ~= nil then self.edit156:destroy(); self.edit156 = nil; end;
        if self.rectangle19 ~= nil then self.rectangle19:destroy(); self.rectangle19 = nil; end;
        if self.Adivinhacao ~= nil then self.Adivinhacao:destroy(); self.Adivinhacao = nil; end;
        if self.label97 ~= nil then self.label97:destroy(); self.label97 = nil; end;
        if self.edit97 ~= nil then self.edit97:destroy(); self.edit97 = nil; end;
        if self.label110 ~= nil then self.label110:destroy(); self.label110 = nil; end;
        if self.rectangle87 ~= nil then self.rectangle87:destroy(); self.rectangle87 = nil; end;
        if self.rectangle77 ~= nil then self.rectangle77:destroy(); self.rectangle77 = nil; end;
        if self.edit161 ~= nil then self.edit161:destroy(); self.edit161 = nil; end;
        if self.REBA_QUAD ~= nil then self.REBA_QUAD:destroy(); self.REBA_QUAD = nil; end;
        if self.edit22 ~= nil then self.edit22:destroy(); self.edit22 = nil; end;
        if self.layout72 ~= nil then self.layout72:destroy(); self.layout72 = nil; end;
        if self.label98 ~= nil then self.label98:destroy(); self.label98 = nil; end;
        if self.checkBox2 ~= nil then self.checkBox2:destroy(); self.checkBox2 = nil; end;
        if self.rectangle92 ~= nil then self.rectangle92:destroy(); self.rectangle92 = nil; end;
        if self.layout114 ~= nil then self.layout114:destroy(); self.layout114 = nil; end;
        if self.rectangle35 ~= nil then self.rectangle35:destroy(); self.rectangle35 = nil; end;
        if self.label61 ~= nil then self.label61:destroy(); self.label61 = nil; end;
        if self.edit158 ~= nil then self.edit158:destroy(); self.edit158 = nil; end;
        if self.edit25 ~= nil then self.edit25:destroy(); self.edit25 = nil; end;
        if self.layout77 ~= nil then self.layout77:destroy(); self.layout77 = nil; end;
        if self.layout34 ~= nil then self.layout34:destroy(); self.layout34 = nil; end;
        if self.rectangle89 ~= nil then self.rectangle89:destroy(); self.rectangle89 = nil; end;
        if self.rectangle30 ~= nil then self.rectangle30:destroy(); self.rectangle30 = nil; end;
        if self.edit28 ~= nil then self.edit28:destroy(); self.edit28 = nil; end;
        if self.edit63 ~= nil then self.edit63:destroy(); self.edit63 = nil; end;
        if self.layout31 ~= nil then self.layout31:destroy(); self.layout31 = nil; end;
        if self.tab17 ~= nil then self.tab17:destroy(); self.tab17 = nil; end;
        if self.edit174 ~= nil then self.edit174:destroy(); self.edit174 = nil; end;
        if self.tab9 ~= nil then self.tab9:destroy(); self.tab9 = nil; end;
        if self.button31 ~= nil then self.button31:destroy(); self.button31 = nil; end;
        if self.Grad ~= nil then self.Grad:destroy(); self.Grad = nil; end;
        if self.tab2 ~= nil then self.tab2:destroy(); self.tab2 = nil; end;
        if self.layout50 ~= nil then self.layout50:destroy(); self.layout50 = nil; end;
        if self.AGILIDADE ~= nil then self.AGILIDADE:destroy(); self.AGILIDADE = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.layout62 ~= nil then self.layout62:destroy(); self.layout62 = nil; end;
        if self.edit69 ~= nil then self.edit69:destroy(); self.edit69 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.Efeito ~= nil then self.Efeito:destroy(); self.Efeito = nil; end;
        if self.edit104 ~= nil then self.edit104:destroy(); self.edit104 = nil; end;
        if self.Iniciativa ~= nil then self.Iniciativa:destroy(); self.Iniciativa = nil; end;
        if self.label43 ~= nil then self.label43:destroy(); self.label43 = nil; end;
        if self.tab7 ~= nil then self.tab7:destroy(); self.tab7 = nil; end;
        if self.layout55 ~= nil then self.layout55:destroy(); self.layout55 = nil; end;
        if self.layout16 ~= nil then self.layout16:destroy(); self.layout16 = nil; end;
        if self.label30 ~= nil then self.label30:destroy(); self.label30 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.edit39 ~= nil then self.edit39:destroy(); self.edit39 = nil; end;
        if self.layout69 ~= nil then self.layout69:destroy(); self.layout69 = nil; end;
        if self.PASS_QUAD ~= nil then self.PASS_QUAD:destroy(); self.PASS_QUAD = nil; end;
        if self.edit128 ~= nil then self.edit128:destroy(); self.edit128 = nil; end;
        if self.rectangle61 ~= nil then self.rectangle61:destroy(); self.rectangle61 = nil; end;
        if self.layout13 ~= nil then self.layout13:destroy(); self.layout13 = nil; end;
        if self.label35 ~= nil then self.label35:destroy(); self.label35 = nil; end;
        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.edit32 ~= nil then self.edit32:destroy(); self.edit32 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.label49 ~= nil then self.label49:destroy(); self.label49 = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.button13 ~= nil then self.button13:destroy(); self.button13 = nil; end;
        if self.button23 ~= nil then self.button23:destroy(); self.button23 = nil; end;
        if self.label89 ~= nil then self.label89:destroy(); self.label89 = nil; end;
        if self.edit37 ~= nil then self.edit37:destroy(); self.edit37 = nil; end;
        if self.rectangle40 ~= nil then self.rectangle40:destroy(); self.rectangle40 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.rectangle ~= nil then self.rectangle:destroy(); self.rectangle = nil; end;
        if self.layout40 ~= nil then self.layout40:destroy(); self.layout40 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.button14 ~= nil then self.button14:destroy(); self.button14 = nil; end;
        if self.button26 ~= nil then self.button26:destroy(); self.button26 = nil; end;
        if self.edit80 ~= nil then self.edit80:destroy(); self.edit80 = nil; end;
        if self.Acrobacia ~= nil then self.Acrobacia:destroy(); self.Acrobacia = nil; end;
        if self.edit126 ~= nil then self.edit126:destroy(); self.edit126 = nil; end;
        if self.label124 ~= nil then self.label124:destroy(); self.label124 = nil; end;
        if self.rectangle45 ~= nil then self.rectangle45:destroy(); self.rectangle45 = nil; end;
        if self.richEdit3 ~= nil then self.richEdit3:destroy(); self.richEdit3 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.edit181 ~= nil then self.edit181:destroy(); self.edit181 = nil; end;
        if self.label87 ~= nil then self.label87:destroy(); self.label87 = nil; end;
        if self.edit191 ~= nil then self.edit191:destroy(); self.edit191 = nil; end;
        if self.edit87 ~= nil then self.edit87:destroy(); self.edit87 = nil; end;
        if self.richEdit6 ~= nil then self.richEdit6:destroy(); self.richEdit6 = nil; end;
        if self.label108 ~= nil then self.label108:destroy(); self.label108 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.label27 ~= nil then self.label27:destroy(); self.label27 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.edit54 ~= nil then self.edit54:destroy(); self.edit54 = nil; end;
        if self.label58 ~= nil then self.label58:destroy(); self.label58 = nil; end;
        if self.edit186 ~= nil then self.edit186:destroy(); self.edit186 = nil; end;
        if self.edit194 ~= nil then self.edit194:destroy(); self.edit194 = nil; end;
        if self.VIGOR ~= nil then self.VIGOR:destroy(); self.VIGOR = nil; end;
        if self.edit133 ~= nil then self.edit133:destroy(); self.edit133 = nil; end;
        if self.layout86 ~= nil then self.layout86:destroy(); self.layout86 = nil; end;
        if self.rectangle7 ~= nil then self.rectangle7:destroy(); self.rectangle7 = nil; end;
        if self.label55 ~= nil then self.label55:destroy(); self.label55 = nil; end;
        if self.edit51 ~= nil then self.edit51:destroy(); self.edit51 = nil; end;
        if self.layout94 ~= nil then self.layout94:destroy(); self.layout94 = nil; end;
        if self.label131 ~= nil then self.label131:destroy(); self.label131 = nil; end;
        if self.scrollBox4 ~= nil then self.scrollBox4:destroy(); self.scrollBox4 = nil; end;
        if self.LUTA ~= nil then self.LUTA:destroy(); self.LUTA = nil; end;
        if self.rectangle50 ~= nil then self.rectangle50:destroy(); self.rectangle50 = nil; end;
        if self.layout26 ~= nil then self.layout26:destroy(); self.layout26 = nil; end;
        if self.CorpoACorpo ~= nil then self.CorpoACorpo:destroy(); self.CorpoACorpo = nil; end;
        if self.edit136 ~= nil then self.edit136:destroy(); self.edit136 = nil; end;
        if self.edit140 ~= nil then self.edit140:destroy(); self.edit140 = nil; end;
        if self.layout81 ~= nil then self.layout81:destroy(); self.layout81 = nil; end;
        if self.layout91 ~= nil then self.layout91:destroy(); self.layout91 = nil; end;
        if self.Poder ~= nil then self.Poder:destroy(); self.Poder = nil; end;
        if self.Duracao ~= nil then self.Duracao:destroy(); self.Duracao = nil; end;
        if self.Tiltado ~= nil then self.Tiltado:destroy(); self.Tiltado = nil; end;
        if self.Investigacao ~= nil then self.Investigacao:destroy(); self.Investigacao = nil; end;
        if self.label106 ~= nil then self.label106:destroy(); self.label106 = nil; end;
        if self.rectangle28 ~= nil then self.rectangle28:destroy(); self.rectangle28 = nil; end;
        if self.rectangle57 ~= nil then self.rectangle57:destroy(); self.rectangle57 = nil; end;
        if self.label74 ~= nil then self.label74:destroy(); self.label74 = nil; end;
        if self.scrollBox3 ~= nil then self.scrollBox3:destroy(); self.scrollBox3 = nil; end;
        if self.edit139 ~= nil then self.edit139:destroy(); self.edit139 = nil; end;
        if self.layout109 ~= nil then self.layout109:destroy(); self.layout109 = nil; end;
        if self.layout102 ~= nil then self.layout102:destroy(); self.layout102 = nil; end;
        if self.label134 ~= nil then self.label134:destroy(); self.label134 = nil; end;
        if self.VEL_QUAD ~= nil then self.VEL_QUAD:destroy(); self.VEL_QUAD = nil; end;
        if self.edit113 ~= nil then self.edit113:destroy(); self.edit113 = nil; end;
        if self.rectangle25 ~= nil then self.rectangle25:destroy(); self.rectangle25 = nil; end;
        if self.rectangle11 ~= nil then self.rectangle11:destroy(); self.rectangle11 = nil; end;
        if self.layout28 ~= nil then self.layout28:destroy(); self.layout28 = nil; end;
        if self.label71 ~= nil then self.label71:destroy(); self.label71 = nil; end;
        if self.edit76 ~= nil then self.edit76:destroy(); self.edit76 = nil; end;
        if self.edit44 ~= nil then self.edit44:destroy(); self.edit44 = nil; end;
        if self.edit201 ~= nil then self.edit201:destroy(); self.edit201 = nil; end;
        if self.edit211 ~= nil then self.edit211:destroy(); self.edit211 = nil; end;
        if self.Vontade ~= nil then self.Vontade:destroy(); self.Vontade = nil; end;
        if self.edit116 ~= nil then self.edit116:destroy(); self.edit116 = nil; end;
        if self.edit155 ~= nil then self.edit155:destroy(); self.edit155 = nil; end;
        if self.Dano ~= nil then self.Dano:destroy(); self.Dano = nil; end;
        if self.label90 ~= nil then self.label90:destroy(); self.label90 = nil; end;
        if self.edit169 ~= nil then self.edit169:destroy(); self.edit169 = nil; end;
        if self.edit94 ~= nil then self.edit94:destroy(); self.edit94 = nil; end;
        if self.edit73 ~= nil then self.edit73:destroy(); self.edit73 = nil; end;
        if self.edit43 ~= nil then self.edit43:destroy(); self.edit43 = nil; end;
        if self.label113 ~= nil then self.label113:destroy(); self.label113 = nil; end;
        if self.rectangle84 ~= nil then self.rectangle84:destroy(); self.rectangle84 = nil; end;
        if self.Encantamentos ~= nil then self.Encantamentos:destroy(); self.Encantamentos = nil; end;
        if self.rectangle72 ~= nil then self.rectangle72:destroy(); self.rectangle72 = nil; end;
        if self.edit204 ~= nil then self.edit204:destroy(); self.edit204 = nil; end;
        if self.edit162 ~= nil then self.edit162:destroy(); self.edit162 = nil; end;
        if self.edit150 ~= nil then self.edit150:destroy(); self.edit150 = nil; end;
        if self.label116 ~= nil then self.label116:destroy(); self.label116 = nil; end;
        if self.label95 ~= nil then self.label95:destroy(); self.label95 = nil; end;
        if self.rectangle81 ~= nil then self.rectangle81:destroy(); self.rectangle81 = nil; end;
        if self.edit99 ~= nil then self.edit99:destroy(); self.edit99 = nil; end;
        if self.rectangle91 ~= nil then self.rectangle91:destroy(); self.rectangle91 = nil; end;
        if self.rectangle75 ~= nil then self.rectangle75:destroy(); self.rectangle75 = nil; end;
        if self.label64 ~= nil then self.label64:destroy(); self.label64 = nil; end;
        if self.Tratamento ~= nil then self.Tratamento:destroy(); self.Tratamento = nil; end;
        if self.edit20 ~= nil then self.edit20:destroy(); self.edit20 = nil; end;
        if self.layout74 ~= nil then self.layout74:destroy(); self.layout74 = nil; end;
        if self.layout39 ~= nil then self.layout39:destroy(); self.layout39 = nil; end;
        if self.label119 ~= nil then self.label119:destroy(); self.label119 = nil; end;
        if self.tabControl2 ~= nil then self.tabControl2:destroy(); self.tabControl2 = nil; end;
        if self.layout112 ~= nil then self.layout112:destroy(); self.layout112 = nil; end;
        if self.Herbologia ~= nil then self.Herbologia:destroy(); self.Herbologia = nil; end;
        if self.rectangle33 ~= nil then self.rectangle33:destroy(); self.rectangle33 = nil; end;
        if self.rectangle78 ~= nil then self.rectangle78:destroy(); self.rectangle78 = nil; end;
        if self.label63 ~= nil then self.label63:destroy(); self.label63 = nil; end;
        if self.edit66 ~= nil then self.edit66:destroy(); self.edit66 = nil; end;
        if self.layout36 ~= nil then self.layout36:destroy(); self.layout36 = nil; end;
        if self.Area ~= nil then self.Area:destroy(); self.Area = nil; end;
        if self.tab12 ~= nil then self.tab12:destroy(); self.tab12 = nil; end;
        if self.edit177 ~= nil then self.edit177:destroy(); self.edit177 = nil; end;
        if self.Azaracao ~= nil then self.Azaracao:destroy(); self.Azaracao = nil; end;
        if self.layout58 ~= nil then self.layout58:destroy(); self.layout58 = nil; end;
        if self.edit61 ~= nil then self.edit61:destroy(); self.edit61 = nil; end;
        if self.layout33 ~= nil then self.layout33:destroy(); self.layout33 = nil; end;
        if self.tab15 ~= nil then self.tab15:destroy(); self.tab15 = nil; end;
        if self.edit172 ~= nil then self.edit172:destroy(); self.edit172 = nil; end;
        if self.rectangle39 ~= nil then self.rectangle39:destroy(); self.rectangle39 = nil; end;
        if self.label38 ~= nil then self.label38:destroy(); self.label38 = nil; end;
        if self.layout61 ~= nil then self.layout61:destroy(); self.layout61 = nil; end;
        if self.button9 ~= nil then self.button9:destroy(); self.button9 = nil; end;
        if self.edit101 ~= nil then self.edit101:destroy(); self.edit101 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.tab18 ~= nil then self.tab18:destroy(); self.tab18 = nil; end;
        if self.label46 ~= nil then self.label46:destroy(); self.label46 = nil; end;
        if self.rectangle69 ~= nil then self.rectangle69:destroy(); self.rectangle69 = nil; end;
        if self.layout56 ~= nil then self.layout56:destroy(); self.layout56 = nil; end;
        if self.layout64 ~= nil then self.layout64:destroy(); self.layout64 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.edit106 ~= nil then self.edit106:destroy(); self.edit106 = nil; end;
        if self.ContraFeitico ~= nil then self.ContraFeitico:destroy(); self.ContraFeitico = nil; end;
        if self.label41 ~= nil then self.label41:destroy(); self.label41 = nil; end;
        if self.tab5 ~= nil then self.tab5:destroy(); self.tab5 = nil; end;
        if self.rectangle62 ~= nil then self.rectangle62:destroy(); self.rectangle62 = nil; end;
        if self.edit178 ~= nil then self.edit178:destroy(); self.edit178 = nil; end;
        if self.layout14 ~= nil then self.layout14:destroy(); self.layout14 = nil; end;
        if self.label32 ~= nil then self.label32:destroy(); self.label32 = nil; end;
        if self.button7 ~= nil then self.button7:destroy(); self.button7 = nil; end;
        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.rectangle48 ~= nil then self.rectangle48:destroy(); self.rectangle48 = nil; end;
        if self.rectangle67 ~= nil then self.rectangle67:destroy(); self.rectangle67 = nil; end;
        if self.layout11 ~= nil then self.layout11:destroy(); self.layout11 = nil; end;
        if self.label37 ~= nil then self.label37:destroy(); self.label37 = nil; end;
        if self.edit88 ~= nil then self.edit88:destroy(); self.edit88 = nil; end;
        if self.edit30 ~= nil then self.edit30:destroy(); self.edit30 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.layout43 ~= nil then self.layout43:destroy(); self.layout43 = nil; end;
        if self.edit123 ~= nil then self.edit123:destroy(); self.edit123 = nil; end;
        if self.label121 ~= nil then self.label121:destroy(); self.label121 = nil; end;
        if self.button11 ~= nil then self.button11:destroy(); self.button11 = nil; end;
        if self.button25 ~= nil then self.button25:destroy(); self.button25 = nil; end;
        if self.edit199 ~= nil then self.edit199:destroy(); self.edit199 = nil; end;
        if self.edit35 ~= nil then self.edit35:destroy(); self.edit35 = nil; end;
        if self.rectangle42 ~= nil then self.rectangle42:destroy(); self.rectangle42 = nil; end;
        if self.layout46 ~= nil then self.layout46:destroy(); self.layout46 = nil; end;
        if self.edit124 ~= nil then self.edit124:destroy(); self.edit124 = nil; end;
        if self.label126 ~= nil then self.label126:destroy(); self.label126 = nil; end;
        if self.label82 ~= nil then self.label82:destroy(); self.label82 = nil; end;
        if self.button28 ~= nil then self.button28:destroy(); self.button28 = nil; end;
        if self.edit82 ~= nil then self.edit82:destroy(); self.edit82 = nil; end;
        if self.richEdit5 ~= nil then self.richEdit5:destroy(); self.richEdit5 = nil; end;
        if self.rectangle47 ~= nil then self.rectangle47:destroy(); self.rectangle47 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.label22 ~= nil then self.label22:destroy(); self.label22 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.edit59 ~= nil then self.edit59:destroy(); self.edit59 = nil; end;
        if self.layout49 ~= nil then self.layout49:destroy(); self.layout49 = nil; end;
        if self.label85 ~= nil then self.label85:destroy(); self.label85 = nil; end;
        if self.Runas ~= nil then self.Runas:destroy(); self.Runas = nil; end;
        if self.Resistencia ~= nil then self.Resistencia:destroy(); self.Resistencia = nil; end;
        if self.edit183 ~= nil then self.edit183:destroy(); self.edit183 = nil; end;
        if self.edit193 ~= nil then self.edit193:destroy(); self.edit193 = nil; end;
        if self.edit148 ~= nil then self.edit148:destroy(); self.edit148 = nil; end;
        if self.richEdit8 ~= nil then self.richEdit8:destroy(); self.richEdit8 = nil; end;
        if self.layout89 ~= nil then self.layout89:destroy(); self.layout89 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.label29 ~= nil then self.label29:destroy(); self.label29 = nil; end;
        if self.edit56 ~= nil then self.edit56:destroy(); self.edit56 = nil; end;
        if self.label56 ~= nil then self.label56:destroy(); self.label56 = nil; end;
        if self.edit188 ~= nil then self.edit188:destroy(); self.edit188 = nil; end;
        if self.edit196 ~= nil then self.edit196:destroy(); self.edit196 = nil; end;
        if self.layout25 ~= nil then self.layout25:destroy(); self.layout25 = nil; end;
        if self.edit145 ~= nil then self.edit145:destroy(); self.edit145 = nil; end;
        if self.edit131 ~= nil then self.edit131:destroy(); self.edit131 = nil; end;
        if self.layout84 ~= nil then self.layout84:destroy(); self.layout84 = nil; end;
        if self.label103 ~= nil then self.label103:destroy(); self.label103 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.label53 ~= nil then self.label53:destroy(); self.label53 = nil; end;
        if self.edit53 ~= nil then self.edit53:destroy(); self.edit53 = nil; end;
        if self.layout92 ~= nil then self.layout92:destroy(); self.layout92 = nil; end;
        if self.label133 ~= nil then self.label133:destroy(); self.label133 = nil; end;
        if self.rectangle52 ~= nil then self.rectangle52:destroy(); self.rectangle52 = nil; end;
        if self.layout20 ~= nil then self.layout20:destroy(); self.layout20 = nil; end;
        if self.label79 ~= nil then self.label79:destroy(); self.label79 = nil; end;
        if self.edit134 ~= nil then self.edit134:destroy(); self.edit134 = nil; end;
        if self.edit142 ~= nil then self.edit142:destroy(); self.edit142 = nil; end;
        if self.label104 ~= nil then self.label104:destroy(); self.label104 = nil; end;
        if self.ATRA_QUAD ~= nil then self.ATRA_QUAD:destroy(); self.ATRA_QUAD = nil; end;
        if self.layout107 ~= nil then self.layout107:destroy(); self.layout107 = nil; end;
        if self.edit209 ~= nil then self.edit209:destroy(); self.edit209 = nil; end;
        if self.popUp ~= nil then self.popUp:destroy(); self.popUp = nil; end;
        if self.rectangle26 ~= nil then self.rectangle26:destroy(); self.rectangle26 = nil; end;
        if self.rectangle14 ~= nil then self.rectangle14:destroy(); self.rectangle14 = nil; end;
        if self.DESTREZA ~= nil then self.DESTREZA:destroy(); self.DESTREZA = nil; end;
        if self.rectangle59 ~= nil then self.rectangle59:destroy(); self.rectangle59 = nil; end;
        if self.label76 ~= nil then self.label76:destroy(); self.label76 = nil; end;
        if self.layout98 ~= nil then self.layout98:destroy(); self.layout98 = nil; end;
        if self.layout100 ~= nil then self.layout100:destroy(); self.layout100 = nil; end;
        if self.edit212 ~= nil then self.edit212:destroy(); self.edit212 = nil; end;
        if self.edit115 ~= nil then self.edit115:destroy(); self.edit115 = nil; end;
        if self.rectangle23 ~= nil then self.rectangle23:destroy(); self.rectangle23 = nil; end;
        if self.rectangle13 ~= nil then self.rectangle13:destroy(); self.rectangle13 = nil; end;
        if self.label73 ~= nil then self.label73:destroy(); self.label73 = nil; end;
        if self.edit91 ~= nil then self.edit91:destroy(); self.edit91 = nil; end;
        if self.edit74 ~= nil then self.edit74:destroy(); self.edit74 = nil; end;
        if self.edit46 ~= nil then self.edit46:destroy(); self.edit46 = nil; end;
        if self.edit207 ~= nil then self.edit207:destroy(); self.edit207 = nil; end;
        if self.edit217 ~= nil then self.edit217:destroy(); self.edit217 = nil; end;
        if self.edit118 ~= nil then self.edit118:destroy(); self.edit118 = nil; end;
        if self.edit157 ~= nil then self.edit157:destroy(); self.edit157 = nil; end;
        if self.edit167 ~= nil then self.edit167:destroy(); self.edit167 = nil; end;
        if self.label96 ~= nil then self.label96:destroy(); self.label96 = nil; end;
        if self.label111 ~= nil then self.label111:destroy(); self.label111 = nil; end;
        if self.edit96 ~= nil then self.edit96:destroy(); self.edit96 = nil; end;
        if self.edit71 ~= nil then self.edit71:destroy(); self.edit71 = nil; end;
        if self.rectangle86 ~= nil then self.rectangle86:destroy(); self.rectangle86 = nil; end;
        if self.Range ~= nil then self.Range:destroy(); self.Range = nil; end;
        if self.rectangle70 ~= nil then self.rectangle70:destroy(); self.rectangle70 = nil; end;
        if self.edit218 ~= nil then self.edit218:destroy(); self.edit218 = nil; end;
        if self.edit160 ~= nil then self.edit160:destroy(); self.edit160 = nil; end;
        if self.DCAT ~= nil then self.DCAT:destroy(); self.DCAT = nil; end;
        if self.edit23 ~= nil then self.edit23:destroy(); self.edit23 = nil; end;
        if self.layout71 ~= nil then self.layout71:destroy(); self.layout71 = nil; end;
        if self.edit152 ~= nil then self.edit152:destroy(); self.edit152 = nil; end;
        if self.label114 ~= nil then self.label114:destroy(); self.label114 = nil; end;
        if self.tabControl1 ~= nil then self.tabControl1:destroy(); self.tabControl1 = nil; end;
        if self.edit48 ~= nil then self.edit48:destroy(); self.edit48 = nil; end;
        if self.rectangle83 ~= nil then self.rectangle83:destroy(); self.rectangle83 = nil; end;
        if self.rectangle93 ~= nil then self.rectangle93:destroy(); self.rectangle93 = nil; end;
        if self.rectangle36 ~= nil then self.rectangle36:destroy(); self.rectangle36 = nil; end;
        if self.label66 ~= nil then self.label66:destroy(); self.label66 = nil; end;
        if self.edit159 ~= nil then self.edit159:destroy(); self.edit159 = nil; end;
        if self.edit26 ~= nil then self.edit26:destroy(); self.edit26 = nil; end;
        if self.layout76 ~= nil then self.layout76:destroy(); self.layout76 = nil; end;
        if self.rectangle88 ~= nil then self.rectangle88:destroy(); self.rectangle88 = nil; end;
        if self.layout110 ~= nil then self.layout110:destroy(); self.layout110 = nil; end;
        if self.rectangle31 ~= nil then self.rectangle31:destroy(); self.rectangle31 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.edit29 ~= nil then self.edit29:destroy(); self.edit29 = nil; end;
        if self.edit64 ~= nil then self.edit64:destroy(); self.edit64 = nil; end;
        if self.layout30 ~= nil then self.layout30:destroy(); self.layout30 = nil; end;
        if self.FORCA ~= nil then self.FORCA:destroy(); self.FORCA = nil; end;
        if self.INTELIGENCIA ~= nil then self.INTELIGENCIA:destroy(); self.INTELIGENCIA = nil; end;
        if self.edit109 ~= nil then self.edit109:destroy(); self.edit109 = nil; end;
        if self.tab10 ~= nil then self.tab10:destroy(); self.tab10 = nil; end;
        if self.edit175 ~= nil then self.edit175:destroy(); self.edit175 = nil; end;
        if self.tab8 ~= nil then self.tab8:destroy(); self.tab8 = nil; end;
        if self.label68 ~= nil then self.label68:destroy(); self.label68 = nil; end;
        if self.button30 ~= nil then self.button30:destroy(); self.button30 = nil; end;
        if self.edit170 ~= nil then self.edit170:destroy(); self.edit170 = nil; end;
        if self.layout53 ~= nil then self.layout53:destroy(); self.layout53 = nil; end;
        if self.layout63 ~= nil then self.layout63:destroy(); self.layout63 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.edit103 ~= nil then self.edit103:destroy(); self.edit103 = nil; end;
        if self.Feiticos ~= nil then self.Feiticos:destroy(); self.Feiticos = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.label44 ~= nil then self.label44:destroy(); self.label44 = nil; end;
        if self.tab6 ~= nil then self.tab6:destroy(); self.tab6 = nil; end;
        if self.layout54 ~= nil then self.layout54:destroy(); self.layout54 = nil; end;
        if self.layout19 ~= nil then self.layout19:destroy(); self.layout19 = nil; end;
        if self.layout66 ~= nil then self.layout66:destroy(); self.layout66 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.edit38 ~= nil then self.edit38:destroy(); self.edit38 = nil; end;
        if self.aqui ~= nil then self.aqui:destroy(); self.aqui = nil; end;
        if self.rectangle60 ~= nil then self.rectangle60:destroy(); self.rectangle60 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.layout12 ~= nil then self.layout12:destroy(); self.layout12 = nil; end;
        if self.button19 ~= nil then self.button19:destroy(); self.button19 = nil; end;
        if self.button5 ~= nil then self.button5:destroy(); self.button5 = nil; end;
        if self.label34 ~= nil then self.label34:destroy(); self.label34 = nil; end;
        if self.label129 ~= nil then self.label129:destroy(); self.label129 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.rectangle65 ~= nil then self.rectangle65:destroy(); self.rectangle65 = nil; end;
        if self.button12 ~= nil then self.button12:destroy(); self.button12 = nil; end;
        if self.button20 ~= nil then self.button20:destroy(); self.button20 = nil; end;
        if self.Intimidacao ~= nil then self.Intimidacao:destroy(); self.Intimidacao = nil; end;
        if self.edit36 ~= nil then self.edit36:destroy(); self.edit36 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.layout41 ~= nil then self.layout41:destroy(); self.layout41 = nil; end;
        if self.edit121 ~= nil then self.edit121:destroy(); self.edit121 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.button17 ~= nil then self.button17:destroy(); self.button17 = nil; end;
        if self.button27 ~= nil then self.button27:destroy(); self.button27 = nil; end;
        if self.edit81 ~= nil then self.edit81:destroy(); self.edit81 = nil; end;
        if self.label123 ~= nil then self.label123:destroy(); self.label123 = nil; end;
        if self.rectangle44 ~= nil then self.rectangle44:destroy(); self.rectangle44 = nil; end;
        if self.layout44 ~= nil then self.layout44:destroy(); self.layout44 = nil; end;
        if self.label21 ~= nil then self.label21:destroy(); self.label21 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.edit180 ~= nil then self.edit180:destroy(); self.edit180 = nil; end;
        if self.label80 ~= nil then self.label80:destroy(); self.label80 = nil; end;
        if self.edit84 ~= nil then self.edit84:destroy(); self.edit84 = nil; end;
        if self.richEdit7 ~= nil then self.richEdit7:destroy(); self.richEdit7 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.label24 ~= nil then self.label24:destroy(); self.label24 = nil; end;
        if self.rectangle9 ~= nil then self.rectangle9:destroy(); self.rectangle9 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        if self.Prestidigitacao ~= nil then self.Prestidigitacao:destroy(); self.Prestidigitacao = nil; end;
        if self.edit185 ~= nil then self.edit185:destroy(); self.edit185 = nil; end;
        if self.edit195 ~= nil then self.edit195:destroy(); self.edit195 = nil; end;
        if self.Transmutacao ~= nil then self.Transmutacao:destroy(); self.Transmutacao = nil; end;
        if self.layout87 ~= nil then self.layout87:destroy(); self.layout87 = nil; end;
        if self.layout97 ~= nil then self.layout97:destroy(); self.layout97 = nil; end;
        if self.rectangle6 ~= nil then self.rectangle6:destroy(); self.rectangle6 = nil; end;
        if self.label54 ~= nil then self.label54:destroy(); self.label54 = nil; end;
        if self.edit50 ~= nil then self.edit50:destroy(); self.edit50 = nil; end;
        if self.Exausto ~= nil then self.Exausto:destroy(); self.Exausto = nil; end;
        if self.FALTA_QUAD ~= nil then self.FALTA_QUAD:destroy(); self.FALTA_QUAD = nil; end;
        if self.rectangle51 ~= nil then self.rectangle51:destroy(); self.rectangle51 = nil; end;
        if self.layout27 ~= nil then self.layout27:destroy(); self.layout27 = nil; end;
        if self.edit147 ~= nil then self.edit147:destroy(); self.edit147 = nil; end;
        if self.edit137 ~= nil then self.edit137:destroy(); self.edit137 = nil; end;
        if self.layout82 ~= nil then self.layout82:destroy(); self.layout82 = nil; end;
        if self.layout90 ~= nil then self.layout90:destroy(); self.layout90 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.label51 ~= nil then self.label51:destroy(); self.label51 = nil; end;
        if self.Persuacao ~= nil then self.Persuacao:destroy(); self.Persuacao = nil; end;
        if self.label101 ~= nil then self.label101:destroy(); self.label101 = nil; end;
        if self.Reflexo ~= nil then self.Reflexo:destroy(); self.Reflexo = nil; end;
        if self.layout108 ~= nil then self.layout108:destroy(); self.layout108 = nil; end;
        if self.rectangle54 ~= nil then self.rectangle54:destroy(); self.rectangle54 = nil; end;
        if self.label135 ~= nil then self.label135:destroy(); self.label135 = nil; end;
        if self.layout22 ~= nil then self.layout22:destroy(); self.layout22 = nil; end;
        if self.outrasPericias_record ~= nil then self.outrasPericias_record:destroy(); self.outrasPericias_record = nil; end;
        if self.layout105 ~= nil then self.layout105:destroy(); self.layout105 = nil; end;
        if self.edit110 ~= nil then self.edit110:destroy(); self.edit110 = nil; end;
        if self.rectangle24 ~= nil then self.rectangle24:destroy(); self.rectangle24 = nil; end;
        if self.rectangle16 ~= nil then self.rectangle16:destroy(); self.rectangle16 = nil; end;
        if self.layout29 ~= nil then self.layout29:destroy(); self.layout29 = nil; end;
        if self.label70 ~= nil then self.label70:destroy(); self.label70 = nil; end;
        if self.edit79 ~= nil then self.edit79:destroy(); self.edit79 = nil; end;
        if self.edit45 ~= nil then self.edit45:destroy(); self.edit45 = nil; end;
        if self.edit202 ~= nil then self.edit202:destroy(); self.edit202 = nil; end;
        if self.edit210 ~= nil then self.edit210:destroy(); self.edit210 = nil; end;
        if self.edit117 ~= nil then self.edit117:destroy(); self.edit117 = nil; end;
        if self.rectangle21 ~= nil then self.rectangle21:destroy(); self.rectangle21 = nil; end;
        if self.edit168 ~= nil then self.edit168:destroy(); self.edit168 = nil; end;
        if self.Percepcao ~= nil then self.Percepcao:destroy(); self.Percepcao = nil; end;
        if self.layout79 ~= nil then self.layout79:destroy(); self.layout79 = nil; end;
        if self.edit93 ~= nil then self.edit93:destroy(); self.edit93 = nil; end;
        if self.edit72 ~= nil then self.edit72:destroy(); self.edit72 = nil; end;
        if self.edit40 ~= nil then self.edit40:destroy(); self.edit40 = nil; end;
        if self.label93 ~= nil then self.label93:destroy(); self.label93 = nil; end;
        if self.edit205 ~= nil then self.edit205:destroy(); self.edit205 = nil; end;
        if self.rectangle73 ~= nil then self.rectangle73:destroy(); self.rectangle73 = nil; end;
        if self.edit215 ~= nil then self.edit215:destroy(); self.edit215 = nil; end;
        if self.edit165 ~= nil then self.edit165:destroy(); self.edit165 = nil; end;
        if self.edit151 ~= nil then self.edit151:destroy(); self.edit151 = nil; end;
        if self.rectangle18 ~= nil then self.rectangle18:destroy(); self.rectangle18 = nil; end;
        if self.label94 ~= nil then self.label94:destroy(); self.label94 = nil; end;
        if self.Aparar ~= nil then self.Aparar:destroy(); self.Aparar = nil; end;
        if self.edit98 ~= nil then self.edit98:destroy(); self.edit98 = nil; end;
        if self.rectangle80 ~= nil then self.rectangle80:destroy(); self.rectangle80 = nil; end;
        if self.label117 ~= nil then self.label117:destroy(); self.label117 = nil; end;
        if self.tabControl4 ~= nil then self.tabControl4:destroy(); self.tabControl4 = nil; end;
        if self.rectangle76 ~= nil then self.rectangle76:destroy(); self.rectangle76 = nil; end;
        if self.label65 ~= nil then self.label65:destroy(); self.label65 = nil; end;
        if self.edit21 ~= nil then self.edit21:destroy(); self.edit21 = nil; end;
        if self.layout73 ~= nil then self.layout73:destroy(); self.layout73 = nil; end;
        if self.layout38 ~= nil then self.layout38:destroy(); self.layout38 = nil; end;
        if self.checkBox3 ~= nil then self.checkBox3:destroy(); self.checkBox3 = nil; end;
        if self.label99 ~= nil then self.label99:destroy(); self.label99 = nil; end;
        if self.tabControl3 ~= nil then self.tabControl3:destroy(); self.tabControl3 = nil; end;
        if self.layout113 ~= nil then self.layout113:destroy(); self.layout113 = nil; end;
        if self.escola ~= nil then self.escola:destroy(); self.escola = nil; end;
        if self.rectangle34 ~= nil then self.rectangle34:destroy(); self.rectangle34 = nil; end;
        if self.rectangle79 ~= nil then self.rectangle79:destroy(); self.rectangle79 = nil; end;
        if self.label60 ~= nil then self.label60:destroy(); self.label60 = nil; end;
        if self.edit24 ~= nil then self.edit24:destroy(); self.edit24 = nil; end;
        if self.edit67 ~= nil then self.edit67:destroy(); self.edit67 = nil; end;
        if self.layout35 ~= nil then self.layout35:destroy(); self.layout35 = nil; end;
        if self.Fadigado ~= nil then self.Fadigado:destroy(); self.Fadigado = nil; end;
        if self.tab13 ~= nil then self.tab13:destroy(); self.tab13 = nil; end;
        if self.edit62 ~= nil then self.edit62:destroy(); self.edit62 = nil; end;
        if self.layout32 ~= nil then self.layout32:destroy(); self.layout32 = nil; end;
        if self.tab16 ~= nil then self.tab16:destroy(); self.tab16 = nil; end;
        if self.edit173 ~= nil then self.edit173:destroy(); self.edit173 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.edit100 ~= nil then self.edit100:destroy(); self.edit100 = nil; end;
        if self.button32 ~= nil then self.button32:destroy(); self.button32 = nil; end;
        if self.tab19 ~= nil then self.tab19:destroy(); self.tab19 = nil; end;
        if self.label47 ~= nil then self.label47:destroy(); self.label47 = nil; end;
        if self.tab3 ~= nil then self.tab3:destroy(); self.tab3 = nil; end;
        if self.rectangle68 ~= nil then self.rectangle68:destroy(); self.rectangle68 = nil; end;
        if self.layout51 ~= nil then self.layout51:destroy(); self.layout51 = nil; end;
        if self.layout65 ~= nil then self.layout65:destroy(); self.layout65 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.edit105 ~= nil then self.edit105:destroy(); self.edit105 = nil; end;
        if self.edit68 ~= nil then self.edit68:destroy(); self.edit68 = nil; end;
        if self.DRI_QUAD ~= nil then self.DRI_QUAD:destroy(); self.DRI_QUAD = nil; end;
        if self.label42 ~= nil then self.label42:destroy(); self.label42 = nil; end;
        if self.tab4 ~= nil then self.tab4:destroy(); self.tab4 = nil; end;
        if self.edit179 ~= nil then self.edit179:destroy(); self.edit179 = nil; end;
        if self.layout17 ~= nil then self.layout17:destroy(); self.layout17 = nil; end;
        if self.label31 ~= nil then self.label31:destroy(); self.label31 = nil; end;
        if self.layout68 ~= nil then self.layout68:destroy(); self.layout68 = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.boxDetalhesDoItem ~= nil then self.boxDetalhesDoItem:destroy(); self.boxDetalhesDoItem = nil; end;
        if self.edit129 ~= nil then self.edit129:destroy(); self.edit129 = nil; end;
        if self.rectangle66 ~= nil then self.rectangle66:destroy(); self.rectangle66 = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.label36 ~= nil then self.label36:destroy(); self.label36 = nil; end;
        if self.edit89 ~= nil then self.edit89:destroy(); self.edit89 = nil; end;
        if self.edit33 ~= nil then self.edit33:destroy(); self.edit33 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.label48 ~= nil then self.label48:destroy(); self.label48 = nil; end;
        if self.edit122 ~= nil then self.edit122:destroy(); self.edit122 = nil; end;
        if self.edit19 ~= nil then self.edit19:destroy(); self.edit19 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.button10 ~= nil then self.button10:destroy(); self.button10 = nil; end;
        if self.nome ~= nil then self.nome:destroy(); self.nome = nil; end;
        if self.button22 ~= nil then self.button22:destroy(); self.button22 = nil; end;
        if self.edit34 ~= nil then self.edit34:destroy(); self.edit34 = nil; end;
        if self.label88 ~= nil then self.label88:destroy(); self.label88 = nil; end;
        if self.label120 ~= nil then self.label120:destroy(); self.label120 = nil; end;
        if self.rectangle41 ~= nil then self.rectangle41:destroy(); self.rectangle41 = nil; end;
        if self.layout47 ~= nil then self.layout47:destroy(); self.layout47 = nil; end;
        if self.edit127 ~= nil then self.edit127:destroy(); self.edit127 = nil; end;
        if self.label125 ~= nil then self.label125:destroy(); self.label125 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.button15 ~= nil then self.button15:destroy(); self.button15 = nil; end;
        if self.label83 ~= nil then self.label83:destroy(); self.label83 = nil; end;
        if self.edit83 ~= nil then self.edit83:destroy(); self.edit83 = nil; end;
        if self.button29 ~= nil then self.button29:destroy(); self.button29 = nil; end;
        if self.richEdit2 ~= nil then self.richEdit2:destroy(); self.richEdit2 = nil; end;
        if self.rectangle46 ~= nil then self.rectangle46:destroy(); self.rectangle46 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.label23 ~= nil then self.label23:destroy(); self.label23 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.edit58 ~= nil then self.edit58:destroy(); self.edit58 = nil; end;
        if self.label86 ~= nil then self.label86:destroy(); self.label86 = nil; end;
        if self.edit182 ~= nil then self.edit182:destroy(); self.edit182 = nil; end;
        if self.edit86 ~= nil then self.edit86:destroy(); self.edit86 = nil; end;
        if self.edit190 ~= nil then self.edit190:destroy(); self.edit190 = nil; end;
        if self.label109 ~= nil then self.label109:destroy(); self.label109 = nil; end;
        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.label26 ~= nil then self.label26:destroy(); self.label26 = nil; end;
        if self.label59 ~= nil then self.label59:destroy(); self.label59 = nil; end;
        if self.edit55 ~= nil then self.edit55:destroy(); self.edit55 = nil; end;
        if self.edit187 ~= nil then self.edit187:destroy(); self.edit187 = nil; end;
        if self.edit197 ~= nil then self.edit197:destroy(); self.edit197 = nil; end;
        if self.CriaturasMagicas ~= nil then self.CriaturasMagicas:destroy(); self.CriaturasMagicas = nil; end;
        if self.PRESENCA ~= nil then self.PRESENCA:destroy(); self.PRESENCA = nil; end;
        if self.edit132 ~= nil then self.edit132:destroy(); self.edit132 = nil; end;
        if self.edit144 ~= nil then self.edit144:destroy(); self.edit144 = nil; end;
        if self.layout85 ~= nil then self.layout85:destroy(); self.layout85 = nil; end;
        if self.label52 ~= nil then self.label52:destroy(); self.label52 = nil; end;
        if self.Pocoes ~= nil then self.Pocoes:destroy(); self.Pocoes = nil; end;
        if self.edit52 ~= nil then self.edit52:destroy(); self.edit52 = nil; end;
        if self.label102 ~= nil then self.label102:destroy(); self.label102 = nil; end;
        if self.layout95 ~= nil then self.layout95:destroy(); self.layout95 = nil; end;
        if self.label130 ~= nil then self.label130:destroy(); self.label130 = nil; end;
        if self.rectangle53 ~= nil then self.rectangle53:destroy(); self.rectangle53 = nil; end;
        if self.layout21 ~= nil then self.layout21:destroy(); self.layout21 = nil; end;
        if self.label78 ~= nil then self.label78:destroy(); self.label78 = nil; end;
        if self.edit135 ~= nil then self.edit135:destroy(); self.edit135 = nil; end;
        if self.scrollBox2 ~= nil then self.scrollBox2:destroy(); self.scrollBox2 = nil; end;
        if self.layout80 ~= nil then self.layout80:destroy(); self.layout80 = nil; end;
        if self.edit141 ~= nil then self.edit141:destroy(); self.edit141 = nil; end;
        if self.label107 ~= nil then self.label107:destroy(); self.label107 = nil; end;
        if self.layout106 ~= nil then self.layout106:destroy(); self.layout106 = nil; end;
        if self.rectangle29 ~= nil then self.rectangle29:destroy(); self.rectangle29 = nil; end;
        if self.rectangle15 ~= nil then self.rectangle15:destroy(); self.rectangle15 = nil; end;
        if self.rectangle56 ~= nil then self.rectangle56:destroy(); self.rectangle56 = nil; end;
        if self.label75 ~= nil then self.label75:destroy(); self.label75 = nil; end;
        if self.edit138 ~= nil then self.edit138:destroy(); self.edit138 = nil; end;
        if self.layout103 ~= nil then self.layout103:destroy(); self.layout103 = nil; end;
        if self.GOL_QUAD ~= nil then self.GOL_QUAD:destroy(); self.GOL_QUAD = nil; end;
        if self.edit112 ~= nil then self.edit112:destroy(); self.edit112 = nil; end;
        if self.rectangle22 ~= nil then self.rectangle22:destroy(); self.rectangle22 = nil; end;
        if self.rectangle10 ~= nil then self.rectangle10:destroy(); self.rectangle10 = nil; end;
        if self.label72 ~= nil then self.label72:destroy(); self.label72 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newHarryFicha()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_HarryFicha();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _HarryFicha = {
    newEditor = newHarryFicha, 
    new = newHarryFicha, 
    name = "HarryFicha", 
    dataType = "HarryPlugin", 
    formType = "sheetTemplate", 
    formComponentName = "form", 
    cacheMode = "none", 
    title = "Ficha Harry Potter Nova!", 
    description=""};

HarryFicha = _HarryFicha;
Firecast.registrarForm(_HarryFicha);
Firecast.registrarDataType(_HarryFicha);

return _HarryFicha;
