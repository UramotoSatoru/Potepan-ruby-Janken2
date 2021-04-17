
class JankenAchimuite

  def initialize()
  end

  def jankenhum
    case
    when @jhuNum == "0"
      @jhuNum = "グー"
    when @jhuNum == "1"
      @jhuNum = "チョキ"
    when @jhuNum == "2"
      @jhuNum = "パー"
    end
  end

  def jankencpu
    case
    when @jcpuNum == "0"
      @jcpuNum = "グー"
    when @jcpuNum == "1"
      @jcpuNum = "チョキ"
    when @jcpuNum == "2"
      @jcpuNum = "パー"
    end
  end

  def jankenFormart
    jankenhum
    jankencpu
    puts "ホイ"
    puts "------------------"
    puts "あなたは：#{@jhuNum}を出しました"
    puts "CPUは：#{@jcpuNum}を出しました"
    puts "------------------"
  end

  def janken
    puts "0(グー)1(チョキ)2(パー)3(戦わない)"
    ## ジャンケンの結果で　win or loseが入る
    @jankenResult = ""
    #to_iメソッドを使わないのは文字列を入力したときに、返り値が0になってしまうから
    @jhuNum = gets.chomp!
    @jcpuNum = rand(3).to_s
    if (@jhuNum === @jcpuNum)
      while @jhuNum === @jcpuNum  do
        jankenFormart
        puts "あいこで…"
        puts "0(グー)1(チョキ)2(パー)3(戦わない)"
        @jhuNum = gets.chomp!
        @jcpuNum = rand(3).to_s
      end
    end

    if((@jhuNum === "0" && @jcpuNum == "1")||(@jhuNum === "1" && @jcpuNum == "2")||(@jhuNum === "2" && @jcpuNum == "0"))
      @jankenResult = "win"
    else
      @jankenResult = "lose"
    end

    if (@jhuNum != "0" && @jhuNum != "1" && @jhuNum != "2" && @jhuNum != "3")
      while @jhuNum != "0" && @jhuNum != "1" && @jhuNum != "2" && @jhuNum != "3"  do
        puts "0123の半角数字を入力してください"
        puts "0(グー)1(チョキ)2(パー)3(戦わない)"
        @jhuNum = gets.chomp!
      end
    end

    if (@jhuNum === "3")
      puts "お疲れ様です"
      exit
    end
    jankenFormart
  end

#0123以外の数字が入力されたら
  def achimuiteNogame
    if (@ahuNum != "0" && @ahuNum != "1" && @ahuNum != "2" && @ahuNum != "3")
      while @ahuNum != "0" && @ahuNum != "1" && @ahuNum != "2" && @ahuNum != "3"  do
        puts "0123の半角数字を入力してください"
        puts "0(上)1(下)2(左)3(右)"
        @ahuNum = gets.chomp!
      end
    end
  end

  def achimuitehum
    case
    when @ahuNum == "0"
      @ahuNum = "上"
    when @ahuNum == "1"
      @ahuNum = "下"
    when @ahuNum == "2"
      @ahuNum = "左"
    when @ahuNum == "3"
      @ahuNum = "右"
    end
  end

  def achimuitecpu
    case
    when @acpuNum == "0"
      @acpuNum = "上"
    when @acpuNum == "1"
      @acpuNum = "下"
    when @acpuNum == "2"
      @acpuNum = "左"
    when @acpuNum == "3"
      @acpuNum = "右"
    end
  end

  def achimuite
    # あっち向いてホイの結果で　win or loseが入る
    @achimuiteResult = ""
    # 指を差す
    if(@jankenResult === "win" )
      puts "あっちむいて〜"
      puts "0(上)1(下)2(左)3(右)"
      @ahuNum = gets.chomp!
      @acpuNum = rand(3).to_s
      achimuiteNogame
      achimuitehum
      achimuitecpu
      puts "------------------"
      puts "あなたは：#{@ahuNum}を出しました"
      puts "CPUは：#{@acpuNum}を出しました"
      puts "------------------"
      if(@acpuNum == @ahuNum)
        @achimuiteResult = "win"
        puts "勝ちました"
      end
    end
    #避ける
    if(@jankenResult == "lose")
      puts "あっちむいて〜"
      puts "0(上)1(下)2(左)3(右)"
      @ahuNum = gets.chomp!
      @acpuNum = rand(4).to_s
      achimuiteNogame
      achimuitehum
      achimuitecpu
      puts "------------------"
      puts "CPUは：#{@acpuNum}を出しました"
      puts "あなたは：#{@ahuNum}を出しました"
      puts "------------------"
      if(@acpuNum == @ahuNum)
        @achimuiteResult = "lose"
        puts "負けました"
      end
    end
    #あっち向いてホイの結果評価
    def jaRasulte
      if (@achimuiteResult == "")
        while @achimuiteResult == "" do
          janken
          achimuite
        end
      end
    end
  end
end

ja = JankenAchimuite.new()
ja.janken()
ja.achimuite()
ja.jaRasulte()
