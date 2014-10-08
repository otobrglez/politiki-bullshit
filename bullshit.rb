class Bullshit
  class NoBullshit < StandardError; end;

  SEGMENT_LIMIT = 9

  def initialize(seed=nil)
    if seed.nil?
      @seed = (1..4).map { rand(SEGMENT_LIMIT) }
    elsif seed.is_a?(String)
      @seed = seed.split("-").map(&:to_i)
    end
  end

  def self.generate
    self.new
  end

  def seed
    @seed.join("-")
  end

  def shit
    @seed.each_with_index.map do |s, i|
      ps = shits_list[i][s]
      raise NoBullshit.new("No such blef!") if ps.nil?
      ps
    end.join(" ")
  end

  def to_s
    shit
  end

  def to_json
    {
      seed: seed,
      url: "/#{seed}",
      api_url: "/api/shits/#{seed}.json",
      shit: shit
    }.to_json
  end

  def shits_list
    shits=[]
    shits[0]    = []
    shits[0][0] = "Pomembno in pozitivno je, da"
    shits[0][1] = "Po drugi strani"
    shits[0][2] = "Prav tako"
    shits[0][3] = "Rad bi poudaril, da"
    shits[0][4] = "Na tak način"
    shits[0][5] = "Ne moremo pa mimo dejstva, da"
    shits[0][6] = "Prav posebno pa"
    shits[0][7] = "Celo več,"
    shits[0][8] = "Višji principi demokratičnosti v naši strani, predvsem pa"
    shits[0][9] = "Odgovorno lahko rečem, da"
    shits[1]    = []
    shits[1][0] = "realizacija programskih nalog"
    shits[1][1] = "naš trenutni položaj"
    shits[1][2] = "kvaliteta in razširjenost naših aktivnosti"
    shits[1][3] = "koalicijski dogovor"
    shits[1][4] = "premagovanje strankarskih nesoglasij"
    shits[1][5] = "konstruktivni dialog"
    shits[1][6] = "krepitev in razvoj družbenih mehanizmov"
    shits[1][7] = "intenzivnosti novih trendov"
    shits[1][8] = "odprava medsebojnega nezaupanja"
    shits[1][9] = "strpno reševanje osnovnih dilem"
    shits[2]    = []
    shits[2][0] = "zahteva temeljito analizo"
    shits[2][1] = "narekuje preciziranje in jasno usmeritev"
    shits[2][2] = "dodatno prispeva k formiranju"
    shits[2][3] = "uravnava participacijo vseh dejavnikov pri kreaciji"
    shits[2][4] = "omogoča večjo kreativnost pri odločanju"
    shits[2][5] = "odpravlja odprta nesoglasja pri oceni"
    shits[2][6] = "spodbuja premostitev nasprotij pri oblikovanju"
    shits[2][7] = "jasneje determinira strategijo"
    shits[2][8] = "tvorno sooblikuje nova stališča do"
    shits[2][9] = "usklajuje oceno pomembnosti"
    shits[3]    = []
    shits[3][0] = "finančnih in administrativnih pogojev delovanja."
    shits[3][1] = "primarnih gospodarskih ciljev."
    shits[3][2] = "aktivnosti vseh političnih subjektov."
    shits[3][3] = "zainteresiranosti družbenih faktorjev."
    shits[3][4] = "organiziranosti kadrovskih struktur."
    shits[3][5] = "nekaterih prednostnih nalog."
    shits[3][6] = "novih zakonskih predlogov."
    shits[3][7] = "sprememb v sistemih funkcioniranja."
    shits[3][8] = "modela splošnega napredka."
    shits[3][9] = "smernic vključevanja v sodobne evropske tokove."
    shits
  end
end
