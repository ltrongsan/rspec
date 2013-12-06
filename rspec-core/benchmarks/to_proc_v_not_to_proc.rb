require 'benchmark'

$n = 5000

puts

def report(header)
  reals = []
  Benchmark.benchmark do |bm|
    3.times do
      reals << bm.report { $n.times { yield } }.real
    end
  end

  [header, reals.inject(&:+) / reals.count]
end

avgs = []

def a(&block)
  b(&block)
end

def b(&block)
  block.call
end

def c(&block)
  d(block)
end

def d(block)
  block.call
end

puts "#{$n} invocations"
puts

avgs << report("with &") {
  a { 100*100*100}
}

puts

avgs << report("without &") {
  c { 100*100*100}
}

puts

puts avgs

puts

__END__

 ruby -e "10.times { system 'ruby benchmarks/to_proc_v_not_to_proc.rb' }"

1000 invocations

   0.010000   0.000000   0.010000 (  0.000958)
   0.000000   0.000000   0.000000 (  0.000917)
   0.000000   0.000000   0.000000 (  0.000893)

   0.000000   0.000000   0.000000 (  0.001660)
   0.000000   0.000000   0.000000 (  0.002686)
   0.000000   0.000000   0.000000 (  0.000686)

with &
0.0009226666666666667
without &
0.0016773333333333334


1000 invocations

   0.000000   0.000000   0.000000 (  0.000898)
   0.000000   0.000000   0.000000 (  0.000868)
   0.010000   0.000000   0.010000 (  0.000768)

   0.000000   0.000000   0.000000 (  0.001615)
   0.000000   0.000000   0.000000 (  0.002917)
   0.000000   0.000000   0.000000 (  0.000996)

with &
0.0008446666666666666
without &
0.0018426666666666667


1000 invocations

   0.000000   0.000000   0.000000 (  0.000884)
   0.000000   0.000000   0.000000 (  0.001217)
   0.000000   0.000000   0.000000 (  0.000877)

   0.000000   0.000000   0.000000 (  0.001617)
   0.010000   0.000000   0.010000 (  0.002718)
   0.000000   0.000000   0.000000 (  0.000772)

with &
0.0009926666666666667
without &
0.0017023333333333335


1000 invocations

   0.000000   0.000000   0.000000 (  0.000868)
   0.000000   0.000000   0.000000 (  0.000874)
   0.000000   0.000000   0.000000 (  0.000829)

   0.000000   0.000000   0.000000 (  0.001394)
   0.010000   0.000000   0.010000 (  0.002330)
   0.000000   0.000000   0.000000 (  0.000712)

with &
0.000857
without &
0.0014786666666666665


1000 invocations

   0.000000   0.000000   0.000000 (  0.000901)
   0.000000   0.000000   0.000000 (  0.000876)
   0.010000   0.000000   0.010000 (  0.000851)

   0.000000   0.000000   0.000000 (  0.001465)
   0.000000   0.000000   0.000000 (  0.002478)
   0.000000   0.000000   0.000000 (  0.000661)

with &
0.000876
without &
0.0015346666666666668


1000 invocations

   0.000000   0.000000   0.000000 (  0.000907)
   0.000000   0.000000   0.000000 (  0.000810)
   0.000000   0.000000   0.000000 (  0.000796)

   0.000000   0.000000   0.000000 (  0.001407)
   0.010000   0.000000   0.010000 (  0.002549)
   0.000000   0.000000   0.000000 (  0.000652)

with &
0.0008376666666666667
without &
0.001536


1000 invocations

   0.000000   0.000000   0.000000 (  0.000852)
   0.000000   0.000000   0.000000 (  0.000884)
   0.000000   0.000000   0.000000 (  0.000829)

   0.010000   0.000000   0.010000 (  0.001471)
   0.000000   0.000000   0.000000 (  0.002701)
   0.000000   0.000000   0.000000 (  0.000729)

with &
0.000855
without &
0.001633666666666667


1000 invocations

   0.000000   0.000000   0.000000 (  0.001089)
   0.010000   0.000000   0.010000 (  0.000957)
   0.000000   0.000000   0.000000 (  0.000813)

   0.000000   0.000000   0.000000 (  0.001477)
   0.000000   0.000000   0.000000 (  0.002500)
   0.000000   0.000000   0.000000 (  0.000666)

with &
0.000953
without &
0.0015476666666666666


1000 invocations

   0.010000   0.000000   0.010000 (  0.000839)
   0.000000   0.000000   0.000000 (  0.000846)
   0.000000   0.000000   0.000000 (  0.000812)

   0.000000   0.000000   0.000000 (  0.001497)
   0.000000   0.000000   0.000000 (  0.002415)
   0.000000   0.000000   0.000000 (  0.000729)

with &
0.0008323333333333334
without &
0.0015470000000000004


1000 invocations

   0.000000   0.000000   0.000000 (  0.000904)
   0.000000   0.000000   0.000000 (  0.000928)
   0.000000   0.000000   0.000000 (  0.000904)

   0.010000   0.000000   0.010000 (  0.001649)
   0.000000   0.000000   0.000000 (  0.002838)
   0.000000   0.000000   0.000000 (  0.000799)

with &
0.0009119999999999999
without &
0.001762

$ ruby -e "10.times { system 'ruby benchmarks/to_proc_v_not_to_proc.rb' }"

5000 invocations

   0.000000   0.000000   0.000000 (  0.007017)
   0.010000   0.000000   0.010000 (  0.005138)
   0.000000   0.000000   0.000000 (  0.005207)

   0.010000   0.000000   0.010000 (  0.005075)
   0.000000   0.000000   0.000000 (  0.005230)
   0.010000   0.000000   0.010000 (  0.006287)

with &
0.005787333333333333
without &
0.005530666666666666


5000 invocations

   0.010000   0.000000   0.010000 (  0.006685)
   0.010000   0.000000   0.010000 (  0.006263)
   0.000000   0.000000   0.000000 (  0.005923)

   0.010000   0.000000   0.010000 (  0.005996)
   0.000000   0.000000   0.000000 (  0.005626)
   0.010000   0.000000   0.010000 (  0.006743)

with &
0.006290333333333334
without &
0.006121666666666667


5000 invocations

   0.010000   0.000000   0.010000 (  0.007708)
   0.010000   0.000000   0.010000 (  0.005533)
   0.000000   0.000000   0.000000 (  0.005451)

   0.010000   0.000000   0.010000 (  0.005297)
   0.000000   0.000000   0.000000 (  0.005129)
   0.010000   0.000000   0.010000 (  0.006554)

with &
0.0062306666666666665
without &
0.005659999999999999


5000 invocations

   0.010000   0.000000   0.010000 (  0.006615)
   0.000000   0.000000   0.000000 (  0.006449)
   0.010000   0.000000   0.010000 (  0.005974)

   0.010000   0.000000   0.010000 (  0.005291)
   0.000000   0.000000   0.000000 (  0.005502)
   0.010000   0.000000   0.010000 (  0.007272)

with &
0.006346
without &
0.006021666666666667


5000 invocations

   0.010000   0.000000   0.010000 (  0.006719)
   0.000000   0.000000   0.000000 (  0.005280)
   0.010000   0.000000   0.010000 (  0.005472)

   0.000000   0.000000   0.000000 (  0.005319)
   0.010000   0.000000   0.010000 (  0.005174)
   0.010000   0.000000   0.010000 (  0.006049)

with &
0.005823666666666667
without &
0.005513999999999999


5000 invocations

   0.010000   0.000000   0.010000 (  0.006857)
   0.010000   0.000000   0.010000 (  0.009484)
   0.000000   0.000000   0.000000 (  0.007458)

   0.010000   0.000000   0.010000 (  0.006191)
   0.010000   0.000000   0.010000 (  0.005341)
   0.000000   0.000000   0.000000 (  0.005976)

with &
0.007933
without &
0.005836000000000001


5000 invocations

   0.010000   0.000000   0.010000 (  0.007637)
   0.000000   0.000000   0.000000 (  0.005701)
   0.010000   0.000000   0.010000 (  0.005383)

   0.000000   0.000000   0.000000 (  0.005185)
   0.010000   0.000000   0.010000 (  0.005211)
   0.010000   0.000000   0.010000 (  0.008762)

with &
0.006240333333333333
without &
0.006386


5000 invocations

   0.010000   0.000000   0.010000 (  0.006861)
   0.010000   0.000000   0.010000 (  0.010632)
   0.000000   0.000000   0.000000 (  0.006004)

   0.010000   0.000000   0.010000 (  0.005384)
   0.010000   0.000000   0.010000 (  0.006040)
   0.000000   0.000000   0.000000 (  0.008638)

with &
0.007832333333333334
without &
0.006687333333333333


5000 invocations

   0.010000   0.000000   0.010000 (  0.006673)
   0.000000   0.000000   0.000000 (  0.005332)
   0.010000   0.000000   0.010000 (  0.005348)

   0.000000   0.000000   0.000000 (  0.005212)
   0.010000   0.000000   0.010000 (  0.005176)
   0.010000   0.000000   0.010000 (  0.005989)

with &
0.005784333333333333
without &
0.0054589999999999994


5000 invocations

   0.010000   0.000000   0.010000 (  0.006795)
   0.000000   0.000000   0.000000 (  0.005278)
   0.010000   0.000000   0.010000 (  0.005466)

   0.010000   0.000000   0.010000 (  0.006348)
   0.000000   0.000000   0.000000 (  0.007129)
   0.010000   0.000000   0.010000 (  0.009930)

with &
0.005846333333333333
without &
0.007802333333333332


$ ruby -e "10.times { system 'ruby benchmarks/to_proc_v_not_to_proc.rb' }"

10000 invocations

   0.010000   0.000000   0.010000 (  0.012112)
   0.010000   0.000000   0.010000 (  0.010734)
   0.020000   0.000000   0.020000 (  0.013636)

   0.010000   0.000000   0.010000 (  0.014597)
   0.010000   0.000000   0.010000 (  0.011408)
   0.020000   0.000000   0.020000 (  0.011720)

with &
0.012160666666666667
without &
0.012575000000000001


10000 invocations

   0.020000   0.000000   0.020000 (  0.012789)
   0.010000   0.000000   0.010000 (  0.010452)
   0.010000   0.000000   0.010000 (  0.012485)

   0.010000   0.000000   0.010000 (  0.011538)
   0.010000   0.000000   0.010000 (  0.010159)
   0.010000   0.000000   0.010000 (  0.011292)

with &
0.011908666666666665
without &
0.010996333333333335


10000 invocations

   0.020000   0.000000   0.020000 (  0.015100)
   0.010000   0.000000   0.010000 (  0.011080)
   0.010000   0.000000   0.010000 (  0.016177)

   0.020000   0.000000   0.020000 (  0.013541)
   0.010000   0.000000   0.010000 (  0.010604)
   0.010000   0.000000   0.010000 (  0.011566)

with &
0.014119000000000001
without &
0.011903666666666667


10000 invocations

   0.010000   0.000000   0.010000 (  0.013065)
   0.020000   0.000000   0.020000 (  0.011556)
   0.010000   0.000000   0.010000 (  0.012144)

   0.010000   0.000000   0.010000 (  0.009862)
   0.010000   0.000000   0.010000 (  0.011292)
   0.010000   0.000000   0.010000 (  0.014442)

with &
0.012255
without &
0.011865333333333334


10000 invocations

   0.010000   0.000000   0.010000 (  0.015715)
   0.010000   0.000000   0.010000 (  0.011772)
   0.020000   0.000000   0.020000 (  0.014638)

   0.010000   0.000000   0.010000 (  0.015350)
   0.010000   0.000000   0.010000 (  0.011328)
   0.020000   0.000000   0.020000 (  0.013594)

with &
0.014041666666666666
without &
0.013424


10000 invocations

   0.010000   0.000000   0.010000 (  0.013395)
   0.020000   0.000000   0.020000 (  0.012911)
   0.010000   0.000000   0.010000 (  0.012247)

   0.010000   0.000000   0.010000 (  0.011711)
   0.010000   0.000000   0.010000 (  0.013390)
   0.020000   0.000000   0.020000 (  0.013257)

with &
0.012851000000000001
without &
0.012785999999999999


10000 invocations

   0.020000   0.000000   0.020000 (  0.014683)
   0.010000   0.000000   0.010000 (  0.012940)
   0.010000   0.000000   0.010000 (  0.012317)

   0.020000   0.000000   0.020000 (  0.015153)
   0.010000   0.000000   0.010000 (  0.014927)
   0.020000   0.000000   0.020000 (  0.015575)

with &
0.013313333333333335
without &
0.015218333333333334


10000 invocations

   0.020000   0.000000   0.020000 (  0.016568)
   0.010000   0.000000   0.010000 (  0.014674)
   0.020000   0.000000   0.020000 (  0.013102)

   0.010000   0.000000   0.010000 (  0.010525)
   0.010000   0.000000   0.010000 (  0.012797)
   0.010000   0.000000   0.010000 (  0.013213)

with &
0.014781333333333334
without &
0.012178333333333333


10000 invocations

   0.010000   0.000000   0.010000 (  0.015328)
   0.020000   0.000000   0.020000 (  0.017426)
   0.020000   0.000000   0.020000 (  0.020689)

   0.010000   0.000000   0.010000 (  0.014016)
   0.010000   0.000000   0.010000 (  0.011353)
   0.020000   0.000000   0.020000 (  0.017668)

with &
0.01781433333333333
without &
0.014345666666666668


10000 invocations

   0.020000   0.000000   0.020000 (  0.015356)
   0.010000   0.000000   0.010000 (  0.015558)
   0.020000   0.000000   0.020000 (  0.012719)

   0.010000   0.000000   0.010000 (  0.011133)
   0.010000   0.000000   0.010000 (  0.010461)
   0.010000   0.000000   0.010000 (  0.013035)

with &
0.014544333333333333
without &
0.011543
