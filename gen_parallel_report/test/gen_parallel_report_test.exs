defmodule GenParallelReportTest do
  use ExUnit.Case

  @test_file "part_1.csv"

  @test_file_list ["part_1.csv", "part_2.csv", "part_3.csv"]

  describe "build/1" do
    test "When file provided" do
      res =
        @test_file
        |> GenParallelReport.build()

      assert res ==
               {
                 :ok,
                 %{
                   all_hours: %{
                     cleiton: 4497,
                     daniele: 4428,
                     danilo: 4722,
                     diego: 4401,
                     giuliano: 4473,
                     jakeliny: 4656,
                     joseph: 4219,
                     mayk: 4404,
                     rafael: 4388,
                     vinicius: 4587
                   },
                   hours_per_month: %{
                     cleiton: %{
                       abril: 346,
                       agosto: 391,
                       dezembro: 339,
                       fevereiro: 385,
                       janeiro: 376,
                       julho: 355,
                       junho: 392,
                       maio: 410,
                       março: 295,
                       novembro: 374,
                       outubro: 396,
                       setembro: 438
                     },
                     daniele: %{
                       abril: 401,
                       agosto: 343,
                       dezembro: 342,
                       fevereiro: 331,
                       janeiro: 398,
                       julho: 416,
                       junho: 406,
                       maio: 369,
                       março: 427,
                       novembro: 315,
                       outubro: 319,
                       setembro: 361
                     },
                     danilo: %{
                       abril: 463,
                       agosto: 403,
                       dezembro: 310,
                       fevereiro: 428,
                       janeiro: 348,
                       julho: 399,
                       junho: 317,
                       maio: 458,
                       março: 376,
                       novembro: 362,
                       outubro: 468,
                       setembro: 390
                     },
                     diego: %{
                       abril: 398,
                       agosto: 410,
                       dezembro: 462,
                       fevereiro: 322,
                       janeiro: 353,
                       julho: 383,
                       junho: 317,
                       maio: 355,
                       março: 384,
                       novembro: 324,
                       outubro: 306,
                       setembro: 387
                     },
                     giuliano: %{
                       abril: 431,
                       agosto: 333,
                       dezembro: 327,
                       fevereiro: 380,
                       janeiro: 378,
                       julho: 375,
                       junho: 411,
                       maio: 417,
                       março: 290,
                       novembro: 368,
                       outubro: 388,
                       setembro: 375
                     },
                     jakeliny: %{
                       abril: 406,
                       agosto: 333,
                       dezembro: 385,
                       fevereiro: 425,
                       janeiro: 461,
                       julho: 397,
                       junho: 366,
                       maio: 338,
                       março: 406,
                       novembro: 321,
                       outubro: 414,
                       setembro: 404
                     },
                     joseph: %{
                       abril: 301,
                       agosto: 418,
                       dezembro: 382,
                       fevereiro: 327,
                       janeiro: 339,
                       julho: 388,
                       junho: 367,
                       maio: 351,
                       março: 309,
                       novembro: 300,
                       outubro: 357,
                       setembro: 380
                     },
                     mayk: %{
                       abril: 355,
                       agosto: 356,
                       dezembro: 406,
                       fevereiro: 434,
                       janeiro: 335,
                       julho: 377,
                       junho: 396,
                       maio: 345,
                       março: 306,
                       novembro: 433,
                       outubro: 304,
                       setembro: 357
                     },
                     rafael: %{
                       abril: 348,
                       agosto: 418,
                       dezembro: 296,
                       fevereiro: 293,
                       janeiro: 351,
                       julho: 272,
                       junho: 460,
                       maio: 463,
                       março: 434,
                       novembro: 320,
                       outubro: 358,
                       setembro: 375
                     },
                     vinicius: %{
                       abril: 371,
                       agosto: 322,
                       dezembro: 458,
                       fevereiro: 408,
                       janeiro: 403,
                       julho: 433,
                       junho: 407,
                       maio: 357,
                       março: 375,
                       novembro: 332,
                       outubro: 335,
                       setembro: 386
                     }
                   },
                   hours_per_year: %{
                     cleiton: %{2016 => 852, 2017 => 825, 2018 => 924, 2019 => 906, 2020 => 990},
                     daniele: %{2016 => 986, 2017 => 903, 2018 => 880, 2019 => 773, 2020 => 886},
                     danilo: %{2016 => 872, 2017 => 1048, 2018 => 1064, 2019 => 987, 2020 => 751},
                     diego: %{2016 => 930, 2017 => 926, 2018 => 906, 2019 => 791, 2020 => 848},
                     giuliano: %{2016 => 895, 2017 => 948, 2018 => 774, 2019 => 1004, 2020 => 852},
                     jakeliny: %{2016 => 1011, 2017 => 958, 2018 => 880, 2019 => 877, 2020 => 930},
                     joseph: %{2016 => 871, 2017 => 904, 2018 => 743, 2019 => 809, 2020 => 892},
                     mayk: %{2016 => 826, 2017 => 755, 2018 => 1038, 2019 => 1016, 2020 => 769},
                     rafael: %{2016 => 873, 2017 => 759, 2018 => 838, 2019 => 905, 2020 => 1013},
                     vinicius: %{2016 => 895, 2017 => 865, 2018 => 939, 2019 => 946, 2020 => 942}
                   }
                 }
               }
    end

    test "When file not provided" do
      res = GenParallelReport.build()

      assert res == {:error, "Invalid file!"}
    end

    test "When file list not provided" do
      res = GenParallelReport.report_from_many("")

      assert res == {:error, "Invalid file list"}
    end

    test "When file list provided" do
      res = GenParallelReport.report_from_many(@test_file_list)

      assert res ==
               %{
                 all_hours: %{
                   cleiton: 13797,
                   daniele: 13264,
                   danilo: 13583,
                   diego: 13015,
                   giuliano: 13671,
                   jakeliny: 13909,
                   joseph: 13174,
                   mayk: 13526,
                   rafael: 13597,
                   vinicius: 13412
                 },
                 hours_per_month: %{
                   cleiton: %{
                     abril: 1161,
                     agosto: 1149,
                     dezembro: 1100,
                     fevereiro: 1168,
                     janeiro: 1271,
                     julho: 1236,
                     junho: 1123,
                     maio: 998,
                     março: 1091,
                     novembro: 1266,
                     outubro: 1073,
                     setembro: 1161
                   },
                   daniele: %{
                     abril: 1138,
                     agosto: 1018,
                     dezembro: 1019,
                     fevereiro: 1003,
                     janeiro: 1130,
                     julho: 1135,
                     junho: 1092,
                     maio: 1170,
                     março: 1177,
                     novembro: 1131,
                     outubro: 1046,
                     setembro: 1205
                   },
                   danilo: %{
                     abril: 1232,
                     agosto: 1200,
                     dezembro: 1149,
                     fevereiro: 1156,
                     janeiro: 1121,
                     julho: 1114,
                     junho: 966,
                     maio: 1075,
                     março: 1096,
                     novembro: 1122,
                     outubro: 1237,
                     setembro: 1115
                   },
                   diego: %{
                     abril: 1112,
                     agosto: 1129,
                     dezembro: 1177,
                     fevereiro: 1144,
                     janeiro: 1118,
                     julho: 1099,
                     junho: 1073,
                     maio: 1082,
                     março: 1029,
                     novembro: 995,
                     outubro: 928,
                     setembro: 1129
                   },
                   giuliano: %{
                     abril: 1152,
                     agosto: 1126,
                     dezembro: 1100,
                     fevereiro: 1173,
                     janeiro: 1107,
                     julho: 1169,
                     junho: 1197,
                     maio: 1182,
                     março: 1097,
                     novembro: 1105,
                     outubro: 1123,
                     setembro: 1140
                   },
                   jakeliny: %{
                     abril: 1172,
                     agosto: 1098,
                     dezembro: 1122,
                     fevereiro: 1119,
                     janeiro: 1118,
                     julho: 1245,
                     junho: 1182,
                     maio: 1129,
                     março: 1178,
                     novembro: 1085,
                     outubro: 1197,
                     setembro: 1264
                   },
                   joseph: %{
                     abril: 1047,
                     agosto: 1167,
                     dezembro: 1122,
                     fevereiro: 1202,
                     janeiro: 1084,
                     julho: 1153,
                     junho: 1105,
                     maio: 1082,
                     março: 1038,
                     novembro: 1005,
                     outubro: 1058,
                     setembro: 1111
                   },
                   mayk: %{
                     abril: 1016,
                     agosto: 1079,
                     dezembro: 1159,
                     fevereiro: 1085,
                     janeiro: 1100,
                     julho: 1093,
                     junho: 1190,
                     maio: 1173,
                     março: 1166,
                     novembro: 1257,
                     outubro: 1094,
                     setembro: 1114
                   },
                   rafael: %{
                     abril: 1171,
                     agosto: 1199,
                     dezembro: 965,
                     fevereiro: 1042,
                     janeiro: 1125,
                     julho: 1097,
                     junho: 1218,
                     maio: 1141,
                     março: 1220,
                     novembro: 1163,
                     outubro: 1161,
                     setembro: 1095
                   },
                   vinicius: %{
                     abril: 1149,
                     agosto: 1055,
                     dezembro: 1186,
                     fevereiro: 1102,
                     janeiro: 1036,
                     julho: 979,
                     junho: 1213,
                     maio: 1109,
                     março: 1191,
                     novembro: 1169,
                     outubro: 1113,
                     setembro: 1110
                   }
                 },
                 hours_per_year: %{
                   cleiton: %{
                     2016 => 2699,
                     2017 => 2684,
                     2018 => 2805,
                     2019 => 2714,
                     2020 => 2895
                   },
                   daniele: %{
                     2016 => 2573,
                     2017 => 2862,
                     2018 => 2633,
                     2019 => 2562,
                     2020 => 2634
                   },
                   danilo: %{
                     2016 => 2746,
                     2017 => 2534,
                     2018 => 2972,
                     2019 => 2666,
                     2020 => 2665
                   },
                   diego: %{2016 => 2577, 2017 => 2647, 2018 => 2792, 2019 => 2486, 2020 => 2513},
                   giuliano: %{
                     2016 => 2784,
                     2017 => 2696,
                     2018 => 2693,
                     2019 => 2850,
                     2020 => 2648
                   },
                   jakeliny: %{
                     2016 => 2869,
                     2017 => 2625,
                     2018 => 2765,
                     2019 => 2709,
                     2020 => 2941
                   },
                   joseph: %{
                     2016 => 2603,
                     2017 => 2617,
                     2018 => 2587,
                     2019 => 2672,
                     2020 => 2695
                   },
                   mayk: %{2016 => 2644, 2017 => 2735, 2018 => 2770, 2019 => 2778, 2020 => 2599},
                   rafael: %{
                     2016 => 2684,
                     2017 => 2570,
                     2018 => 2628,
                     2019 => 2786,
                     2020 => 2929
                   },
                   vinicius: %{
                     2016 => 2530,
                     2017 => 2720,
                     2018 => 2654,
                     2019 => 2640,
                     2020 => 2868
                   }
                 }
               }
    end
  end
end
