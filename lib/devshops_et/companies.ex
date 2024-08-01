defmodule DevshopsEt.Companies do
  @moduledoc """
  The Companies context.
  """

  @doc """
  Returns the list of companies.

  ## Examples

      iex> list_companies()
      [%Company{}, ...]

  """
  def list_companies do
    [
      %{
        name: "Siidaa Tech",
        logo: "https://siidaatech.com/storage/2022/09/Siidaatech.png",
        website: %{
          url: "https://siidaatech.com/",
          screenshot: "siidaatech.png"
        },
        email: "admin@siidaatech.com",
        phone: [
          "+251913896896",
          "+251903896896"
        ],
        location: "Nefas Silk Lafto, Addis Ababa, Ethiopia",
        socials: [
          %{name: "facebook", url: "https://www.facebook.com/dinka.dereje.5"},
          %{name: "linkedin", url: "https://linkedin.com/in/dinka1way"},
          %{name: "x", url: "https://x.com/dinqoo"}
        ]
      },
      %{
        name: "Zentyad",
        logo: "https://zentyad.com/wp-content/uploads/2024/03/logo-1024x247.png",
        website: %{
          url: "https://zentyad.com",
          screenshot: "zentyad.png"
        },
        email: "info@zentyad.com",
        phone: [
          "+251941790000",
          "+251912850002",
          "+251974400241"
        ],
        location: "Mexico Kkare Building 8th floor, Addis Ababa, Ethiopia",
        socials: [
          %{name: "facebook", url: "https://www.facebook.com/etyeboge"},
          %{name: "telegram", url: "https://t.me/Zentyad_ICT_Training_Consultant"},
          %{
            name: "linkedin",
            url: "https://www.linkedin.com/in/zentyad-trading-etyeboge-905b10182"
          }
        ]
      },
      %{
        name: "Kachamale Technologies",
        logo: "https://www.kachamale.com/img/longlogo3x.png",
        website: %{
          url: "https://www.kachamale.com/",
          screenshot: "kachamale.png"
        },
        email: "info@kachamale.com",
        phone: [
          "+251911114048"
        ],
        location: "Gurd Shola, Addis Ababa, Ethiopia",
        socials: [
          %{
            name: "facebook",
            url: "https://www.facebook.com/people/Kachamale-Technologies/61555678241096/"
          },
          %{name: "instagram", url: "https://www.instagram.com/kachamaletech/"},
          %{name: "linkedin", url: "https://www.linkedin.com/company/kachamale-technologies/"},
          %{name: "x", url: "https://x.com/KachamaleTech"}
        ]
      },
      %{
        name: "AppDiv",
        logo: "https://appdiv.com/images/logo.png",
        website: %{
          url: "https://appdiv.com/",
          screenshot: "appdiv.png"
        },
        email: "ceo@appdiv.com",
        phone: [
          "+251912637046",
          "+251913227270"
        ],
        location: "Gulf Azizi Building, Addis Ababa, Ethiopia",
        socials: [
          %{name: "facebook", url: "https://www.facebook.com/appdiv"},
          %{name: "linkedin", url: "https://www.linkedin.com/company/appdiv-system-development/"},
          %{name: "x", url: "https://x.com/Appdiv"}
        ]
      },
      %{
        name: "NileSync",
        logo: "https://www.nilesync.com/favicon/nilesync-favicon-32x32.png",
        website: %{
          url: "https://www.nilesync.com/",
          screenshot: "nilesync.png"
        },
        email: "tesfamichael@nilesync.com",
        phone: [
          "+48692079416",
          "+251900231875"
        ],
        location: "Addis Ababa, Ethiopia",
        socials: [
          %{name: "linkedin", url: "https://www.linkedin.com/company/nilesync/"}
        ]
      },
      %{
        name: "Get Rest Technology",
        logo: nil,
        website: nil,
        email: "showmore5@gmail.com",
        phone: [
          "+251922045520"
        ],
        location: "Addis Ababa, Ethiopia",
        socials: []
      },
      %{
        name: "Addisway Technology Soloution",
        logo: nil,
        website: %{
          url: "https://www.addisway.com",
          screenshot: "addisway.png"
        },
        email: "info@addisway.com",
        phone: [
          "+251917388888"
        ],
        location: "Addis Ababa, Ethiopia",
        socials: []
      },
      %{
        name: "Invictus PLC",
        logo: nil,
        website: nil,
        email: "tedofekadu@gmail.com",
        phone: [
          "+251913235959"
        ],
        location: "Addis Ababa, Ethiopia",
        socials: []
      },
      %{
        name: "SRE Global",
        logo: "https://sreglobal.org/wp-content/uploads/2024/05/logo.png",
        website: %{
          url: "https://sreglobal.org/",
          screenshot: "sreglobal.png"
        },
        email: "info@sreglobal.org",
        phone: [
          "+251118689915",
          "+251911500988"
        ],
        location: "22 Mazoria Gollagul Tower, Addis Ababa, Ethiopia",
        socials: [
          %{name: "facebook", url: "https://www.facebook.com/sreglobal/"},
          %{name: "youtube", url: "https://www.youtube.com/@sreglobal"},
          %{name: "instagram", url: "https://www.instagram.com/sre_global"},
          %{name: "telegram", url: "https://t.me/sreglobal"},
          %{name: "whatsapp", url: "http://wa.me/16094884973"},
          %{name: "x", url: "https://x.com/REarth57798"}
        ]
      },
      %{
        name: "Collab Systems",
        logo: "https://collabet.com/wp-content/uploads/2022/09/Asset-20-85x22.png",
        website: %{
          url: "https://collabet.com/",
          screenshot: "collab.png"
        },
        email: "hello@collabet.com",
        phone: [
          "+251912811406",
          "+251921025811"
        ],
        location: "Bole Medhanialem, Woldefiker building 3rd Floor, Addis Abeba, Ethiopia",
        socials: [
          %{name: "behance", url: "https://www.behance.net/collabsystems"},
          %{name: "instagram", url: "https://www.instagram.com/collabsystems/"},
          %{name: "facebook", url: "https://www.facebook.com/collabsystemseth/"},
          %{name: "x", url: "https://x.com/collab_systems"}
        ]
      },
      %{
        name: "Vite Technologies",
        logo: nil,
        website: nil,
        email: "viteverse@gmail.com",
        phone: [
          "+251931545451"
        ],
        location: "Addis Ababa, Ethiopia",
        socials: []
      },
      %{
        name: "Cognize Technologies",
        logo:
          "https://img2.hocoos.com/cache/u/308923/270995/w-948/h-948/x-614/y-561/u/308923/270995/CONGNISE%20LOGO%20pre%20(1)_e8d1e.png",
        website: %{
          url: "https://cognizeconsult.com/",
          screenshot: "cognize.png"
        },
        email: "elias@cognizetech.com",
        phone: [
          "+251913596859"
        ],
        location: "Bole Road, Addis Ababa, Ethiopia",
        socials: []
      },
      %{
        name: "Y-Tech Hub",
        logo: "https://ytechub.com/wp-content/uploads/2022/07/Y-Tech-Logo-Darker@3x.png",
        website: %{
          url: "https://ytechub.com/",
          screenshot: "ytechub.png"
        },
        email: "ytechub@gmail.com",
        phone: [
          "+251915539071",
          "+251966739477",
          "+251942408407"
        ],
        location:
          "Dembel Roundabout, Omedad Building 2nd Floor Office #206 Addis Ababa, Ethiopia",
        socials: [
          %{name: "facebook", url: "https://www.facebook.com/ytechet3/"},
          %{name: "instagram", url: "https://www.instagram.com/ytechet3/"},
          %{name: "telegram", url: "https://t.me/ytechet3"},
          %{name: "linkedin", url: "https://www.linkedin.com/company/ytechet3/"}
        ]
      },
      %{
        name: "WF Technology Solution",
        logo: "https://www.wfict.com/themes/basic/images/logo-light.png",
        website: %{
          url: "https://www.wfict.com/",
          screenshot: "wfict.png"
        },
        email: "yonas@wftradingplc.com",
        phone: [
          "+251911221882"
        ],
        location: "Addis Ababa, Ethiopia",
        socials: []
      },
      %{
        name: "Booking Technologies PLC",
        logo: "https://bookingtechsolutions.com/assets/img/Booking%20LOGO-01.png",
        website: %{
          url: "https://bookingtechsolutions.com/",
          screenshot: "bookingtechsolutions.png"
        },
        email: "bookingtechnologies@gmail.com",
        phone: [
          "+251912737252"
        ],
        location: "Bole Road, Zouleka LGK Building, Addis Ababa, Ethiopia",
        socials: [
          %{
            name: "facebook",
            url: "https://www.facebook.com/people/Booking-Technologies/100064940077034"
          },
          %{name: "linkedin", url: "https://www.linkedin.com/company/booking-technologies/"}
        ]
      },
      %{
        name: "Unlimited Systems",
        logo: "https://unlimitedsystems.net/sites/default/files/ULogo5.png",
        website: %{
          url: "https://unlimitedsystems.net/",
          screenshot: "unlimitedsystems.png"
        },
        email: "contact@unlimitedsystems.net",
        phone: [
          "+251944368200"
        ],
        location:
          "Maria Rubatto Bldg (Enat Bank), Haile Gebre Silase Street, Addis Ababa, Ethiopia",
        socials: [
          %{name: "facebook", url: "https://www.facebook.com/unlimitedsystem"},
          %{name: "linkedin", url: "https://www.linkedin.com/company/unlimitedsystems/"}
        ]
      },
      %{
        name: "Abol Technologies",
        logo: nil,
        website: %{
          url: "https://aboltech.com/",
          screenshot: "aboltech.png"
        },
        email: "aboltechnology@gmail.com",
        phone: [
          "+251910532403",
          "+251921625794"
        ],
        location: "Addis Ababa, Ethiopia",
        socials: []
      }
    ]
  end

  @doc """
  Gets a single company.

  Raises if the Company does not exist.

  ## Examples

      iex> get_company!(123)
      %Company{}

  """
  def get_company!(_id), do: raise("TODO")
end
