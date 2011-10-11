object frmXQTipsDlg: TfrmXQTipsDlg
  Left = 207
  Top = 185
  BorderStyle = bsDialog
  Caption = '日集月累 - 快速掌握“象棋演播室”使用技巧'
  ClientHeight = 227
  ClientWidth = 451
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = '宋体'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  object pnlTip: TPanel
    Left = 0
    Top = 0
    Width = 451
    Height = 193
    Align = alTop
    BevelInner = bvLowered
    BevelOuter = bvNone
    BorderWidth = 8
    TabOrder = 0
    object pnlTipIcon: TPanel
      Left = 9
      Top = 9
      Width = 48
      Height = 175
      Align = alLeft
      BevelOuter = bvNone
      Color = clAppWorkSpace
      TabOrder = 0
      object imgTipIcon: TImage
        Left = 8
        Top = 12
        Width = 32
        Height = 32
        AutoSize = True
        Center = True
        Picture.Data = {
          07544269746D617076020000424D760200000000000076000000280000002000
          000020000000010004000000000000020000C40E0000C40E0000100000000000
          000000000000000080000080000000808000800000008000800080800000C0C0
          C000808080000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
          FF00888888888888888888888888888888888888888888888888088888888888
          88888888888888888880E088888888888888888888888888880EFE0888888888
          888888888888888880EFFFE08888888888888888888888880EFFFFFE08888888
          8888888888888880EFFFFFFFE0888888888888888888880EFFF000FFFE088888
          88888888888880EFFF00000FFFE088888888888888880EFFF88F7700FFFE0888
          888888888880EFFFF8F00070FFFFE08888888888880EFFFF880F77000FFFFE08
          8888888880EFFFFF8FF000770FFFFFE088888888888EFFFF800333000FFFFE08
          888888888888EFFF033BBB330FFFE0888888888888888EF03BBBBBBB30FE0888
          88888888888888E03BBFBFBF30E088888888888888888803BBB808BBB3088888
          888888888888803BBFB000BFBF30888888888888888880BBBBF808FBBB308888
          8888888888883BBFBFBFBFBFBFB308888888888888883BBBFBFB0BFBFBB30888
          8888888888883FBFFFFF0FBFBFB308888888888888883BFFFFF808FBFBB30888
          8888888888883BFFFFF000BFBFB3088888888888888883FFFFF000FBFBB08888
          88888888888883BFFFF000BFBFB08888888888888888883BFFF808FBBB088888
          8888888888888883BFBFBFBFB3888888888888888888888833BBBBB338888888
          8888888888888888883333388888888888888888888888888888888888888888
          8888}
        Transparent = True
      end
    end
    object pnlTipShow: TPanel
      Left = 57
      Top = 9
      Width = 385
      Height = 175
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object bvlLine: TBevel
        Left = 0
        Top = 49
        Width = 385
        Height = 4
        Align = alTop
        Shape = bsTopLine
      end
      object pnlTipDYK: TPanel
        Left = 0
        Top = 0
        Width = 385
        Height = 49
        Align = alTop
        Alignment = taLeftJustify
        BevelOuter = bvNone
        BorderWidth = 8
        Caption = '你知道吗? …'
        Color = clWhite
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -29
        Font.Name = '宋体'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object pnlTipMemo: TPanel
        Left = 0
        Top = 53
        Width = 385
        Height = 122
        Align = alClient
        BevelOuter = bvNone
        BorderWidth = 8
        Color = clWhite
        TabOrder = 1
        object memTip: TMemo
          Left = 8
          Top = 8
          Width = 369
          Height = 106
          Align = alClient
          BorderStyle = bsNone
          Font.Charset = GB2312_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = '宋体'
          Font.Style = []
          Lines.Strings = (
            '这是“日积月累”显示窗口，通过长时间的积累，您'
            '会很快掌握本软件的使用方法。')
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
        end
        object memTips: TMemo
          Left = 8
          Top = 8
          Width = 369
          Height = 106
          Align = alClient
          BorderStyle = bsNone
          Font.Charset = GB2312_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = '宋体'
          Font.Style = []
          Lines.Strings = (
            
              '象棋演播室(XQStudio)是专业级的象棋打谱软件，具有方便的棋谱记录、' +
              '欣赏、管理和强大的局面搜索功能，完全可以满足各层次棋手、裁判员及' +
              '象棋文字工作者的各种需要。'
            
              'XQStudio强大的棋谱、棋图导入和导出功能为您在网络上和棋友交流提供' +
              '了极大的方便。'
            
              'XQStudio主要通过Internet发行，最新的版本可以使用浏览器从“http:/' +
              '/www.qipaile.net/xqstudio”这个站点上下载 (请注意字母全部为小写' +
              '，下同) 。'
            
              '目前，网络上已经有数以万计使用XQStudio制作的棋谱文件(棋谱文件后' +
              '缀“.XQF”)可供下载。您可以在“http://www.qipaile.net/xqf”这个' +
              '站点下载这些文件，同时也欢迎您将自己制作的文件上传给我们。'
            
              '如果您对XQStudio有什么意见或建议，可以用作者的邮件地址“xqstudio' +
              '@qipaile.net”和作者联系。作者非常希望和大家保持E-Mail联系。'
            
              '为了方便使用，您可以在桌面上建立XQStudio的快捷方式――图标是一个' +
              '隶书的“象”字，双击该图标即可以直接启动XQStudio。'
            
              '如果您是一个XQStudio的初学者，请您仔细阅读本软件“帮助”选单中的' +
              '“使用说明”并多加练习，祝您早日精通XQStudio的各种功能。'
            
              'XQStudio支持文件关联功能，参见帮助中本软件的使用说明，将.XQF文件' +
              '和XQStudio关联起来后，可以直接双击文件名打开.XQF文件。'
            
              '建立了.XQF文件关联后，您就可以不必解压缩.ZIP文件来查看.ZIP文件中' +
              '的棋谱文件了。'
            
              'XQStudio工作时需要800x600(256色)以上的显示分辩率，同时系统最好使' +
              '用正常字体(小字体)工作方式，请调整您的系统以便达到最好的使用效果' +
              '。'
            
              'XQStudio提供了最近打开文件列表功能，该功能使您可以方便地打开最近' +
              '使用过的棋谱文件。'
            
              'XQStudio网上的家—— http://www.qipaile.net(中文名字:网上棋牌乐)' +
              '，为广大棋牌爱好者提供了一个休闲娱乐的好地方。我们将致力于将本站' +
              '建设成为一个优秀的棋牌门户站点，欢迎您常来看看。'
            
              '“网上棋牌乐”除了发布象棋打谱软件XQStudio的最新版本外，同时还提' +
              '供了新闻链接、经典资料、古今名手、售书服务等栏目，旨在向为广大棋' +
              '牌爱好者提供全方位的服务。'
            
              '在使用文件查找功能时，大部分的查找选项都是“模糊匹配”的，您不必' +
              '输入全部的信息，只要输入部分文字即可开始查找。'
            
              '在如果被查找的文件名中已经包含棋手姓名或胜负信息，查找特定棋手的' +
              '对局时，可只在文件名中指定检索条件，这样，查找时只检查文件名而不' +
              '需要打开文件，能极大地提高查找的速度。'
            
              '为了加快查询速度，平时请注意建立结构良好的目录结构，同时及时将新' +
              '下载或输入的棋谱分类，在查找文件时请尽量指定精确的文件夹位置，避' +
              '免同时在较大范围内搜索。'
            
              '在使用局面查找功能时，一般是不需要自己摆放棋子位置的。在查询窗口' +
              '中，只要你看到左边的局势，就可以查找，不管这个图是打谱时导入的还' +
              '是预览前几步得到的。另外，也可以通过剪贴板将大棋图粘贴到查找界面' +
              '。'
            
              '在使用文件查找功能时，如果一次查找得到的文件个数太多，可以选择在' +
              '这次查找到的文件的基础上指定新的查找条件，重新查找，重复这个过程' +
              '，可以得到满意的查找结果。'
            
              '在查找到的文件列表上单击鼠标右键，可弹出文件查找结果管理功能选单' +
              '，您可以将选中的文件“复制”或“移动”到指定的文件夹。使用此功能' +
              '，制作布局或棋手专集简直易如反掌！'
            
              '为了方便校园网字符BBS的使用者交流棋谱、棋图和发表文章，XQStudio' +
              '提供了文本棋谱和彩色ASCII字符棋图的输出功能。通过剪贴板，您可以' +
              '在BBS上发表精美漂亮的棋谱和棋图了。'
            
              '请注意:“字符BBS颜色”的文本棋图对于HTML浏览器方式工作的论坛论坛' +
              '是不可用的。如果您要在HTML论坛上贴文本棋图，请不要使用颜色功能。'
            
              '如果您在网络论坛上看到了由XQStudio生成的文本棋图(帅用“(帅)”表' +
              '示，将用“[将]”表示)，可以使用XQStudio提供的导入棋图的功能将该' +
              '棋图做成残局文件，免去了摆放棋子位置的烦恼。'
            
              '在打谱过程中，可以随时用鼠标右键单击棋谱文字列表(即紧挨棋盘右恻' +
              '显示文字棋谱的地方)，里面有丰富的导入和导出功能供你选择。'
            
              'XQStudio可以自动地将文本棋谱(如“炮二平五”)记录导入当前棋局。如' +
              '果在论坛上如果有人贴出了对局记录的文本，您可以将该文本复制到剪贴' +
              '板，然后粘贴到当前棋局中。具体的操作方式请参见帮助选单中的“使用' +
              '说明”。'
            
              'XQStudio支持多种格式文本棋谱的输入，包括：传统中文格式、AXF格式' +
              '、WXF格式、ICCS格式等。其中中文格式支持还支持繁体字的棋谱文件。'
            
              'XQStudio可读入联众、弈天、中国游戏中心等中国象棋的存盘文件和大部' +
              '分的文本棋谱文件，对于非“.XQF”文件的支持是通过粘贴文件的功能实' +
              '现的，具体使用方式请参考“使用说明”。'
            
              'XQStudio可将棋谱导出为支持Java动态棋盘的HTML文本，特别适合将棋谱' +
              '在网上发表。'
            
              'XQStudio支持从流行的Java棋盘中导入棋谱。通过粘贴Java棋盘的源文件' +
              '，可将棋谱粘贴到当前棋局。'
            
              'XQStudio提供的电子邮件直接发送棋谱功能使的联网用户之间交流棋谱变' +
              '得更为方便。'
            
              'XQStudio提供的棋谱键盘输入法为喜欢键盘录入棋谱的棋友提供了一种高' +
              '效的棋谱输入方法，棋友可根据自己的习惯在数字小键盘或汉语拼音两种' +
              '输入方式中任意选择。'
            
              '在使用XQStudio时，您可以随时按下“Ctrl+F”组合键或工具条上相应的' +
              '按钮来弹出“文件查找和浏览窗口”。该功能有助于快速切换窗口。'
            
              '在摆放棋子的小棋盘上单击鼠标右键可弹出特殊功能选单，里面的功能可' +
              '能给你带来意外的惊喜。'
            
              '在打谱过程中，用鼠标左键双击棋谱记录，可从该步自动演示，演示的时' +
              '间间隔可以自由调整。在棋谱记录上单击鼠标左键可停止自动演示。'
            
              '稿件棋图的导出功能和Word等字处理文件结合，可以生成漂亮的象棋稿件' +
              '。'
            
              '在打谱的过程中，可以使用棋盘倒置和左右调换功能来从不同的角度欣赏' +
              '棋局。其中左右调换功能还可以一次将类似于“炮八平五”开局这样的棋' +
              '谱自动转换成大家习惯的“炮二平五”。反之亦然。'
            
              '如果在打谱时遇到复杂的局面，可以单击工具条上的“推演”按钮，建立' +
              '当前棋局的推演棋盘，自由推演后续的变化。'
            
              'XQStudio提供的导出和导入文本棋谱的功能可将推演棋盘中的棋谱记录导' +
              '入到当前棋局中。'
            
              'XQStudio合并棋谱功能能可以一次将一个或多个棋谱文件合并到当前文件' +
              '中。合并后的棋谱文件集合并前所有文件的变化为一体，为研究布局和研' +
              '究对手提供了极大的方便。'
            
              'XQStudio不需要特别的安装就可以运行，您可以将执行文件“XQStudio.E' +
              'XE”复制到一张软盘上，复制到不同的机器上运行。如果您愿意，也可以' +
              '在软盘上直接运行。真可谓“小巧玲珑、功能强大”。'
            
              'XQStudio是个自由软件，如果您觉得好用，可以自由地将本软件上载到任' +
              '一个共享软件下载站点，也可以自由地将本软件的主页链接到自己的站点' +
              '上。请您使用“http://www.qipaile.net/xqstuio”作为链接的路径。'
            
              'XQStudio在开发过程中得到了广大棋迷朋友的热情支持，作者在此表示衷' +
              '心的感谢，同时也希望您继续支持XQStudio，关注“http://www.qipaile' +
              '.net”。'
            
              '追求无止境，创意无极限，让我们共同期待象棋演播室(XQStudio)的下一' +
              '个版本“XQStudio 2.0”更上层楼！ (过河象，2002年06月12日于北京)' +
              '。'
            ' '
            ' '
            ' ')
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
          Visible = False
          WordWrap = False
        end
      end
    end
  end
  object chkTipShow: TCheckBox
    Left = 8
    Top = 202
    Width = 185
    Height = 17
    Hint = 
      '|如果选中该选项，每次启动XQStudio时都先显示该提示窗口；如果不希' +
      '望启动时显示该窗口，可不选此项，以后可以从“帮助”选单中打开此窗' +
      '口。'
    Caption = '启动时显示“日积月累”窗口'
    Checked = True
    State = cbChecked
    TabOrder = 1
  end
  object btnClose: TButton
    Left = 368
    Top = 198
    Width = 75
    Height = 21
    Caption = '关闭'
    Default = True
    TabOrder = 4
    OnClick = btnCloseClick
  end
  object btnLastTip: TButton
    Left = 199
    Top = 198
    Width = 75
    Height = 21
    Caption = '< 上一条'
    Enabled = False
    TabOrder = 2
    OnClick = btnLastTipClick
  end
  object btnNextTip: TButton
    Left = 279
    Top = 198
    Width = 75
    Height = 21
    Caption = '下一条 >'
    Enabled = False
    TabOrder = 3
    OnClick = btnNextTipClick
  end
end
