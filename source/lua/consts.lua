-- FIFA Edition
FIFA = "20"

-- PROCESS BASE ADDRESS - Updated after attach
BASE_ADDRESS = nil

-- Size of FIFA module
FIFA_MODULE_SIZE = nil

-- Live Editor ADDRESS LIST
ADDR_LIST = getAddressList()

-- SOME Live Editor MEMORY RECORDS
CT_MEMORY_RECORDS = {
    GUI_SCRIPT = 6,
    CURRENT_DATE_SCRIPT = 4406,
    CURRENT_DATE_DAY = 4408,
    CURRENT_DATE_MONTH = 4410,
    CURRENT_DATE_YEAR = 4409,

    -- Injury
    INJURY_TYPE = 2459,

    -- PLAYERS
    HEADTYPECODE = 50,
    BIRTHDATE = 59,
    PLAYERID = 110,
    HAIRCOLORCODE = 14,

    -- Teamplayerlinks
    TPLINKS_PLAYERID = 3533,
    TEAMID = 3527,

    -- Leagueteamlinks
    LEAGUEID = 4239,
    LTL_TEAMID = 4246, 

    -- Calendar
    CURRDATE = 4362,
}

DB_TABLE_SIZEOF = {
    PLAYERS = 112,
    TEAMPLAYERLINKS = 16,
    LEAGUETEAMLINKS = 28,
}


-- Structrs
INJ_FIT_STRUCT = {
    size = 0x28,
    pid = 0x0,
    tid = 0x4,  -- or -1
    has_data = 0x8,
    fitness = 0xC,
    unk1 = 0x10,
    unk2 = 0x14,
    inj_type = 0x18,
    fit_on = 0x1C,
    unk3 = 0x20, -- 3 for injured
    regenerated = 0x24  -- higher than 0 for non injured, higher each day
}

RLC_STRUCT = {
    size = 0xC,
    pid = 0x0,
    tid = 0x4,
    value = 0x8,
    end_offset = 0x180,
}

PLAYERFORM_STRUCT = {
    size = 0x74,
    pid = 0x0,
    recent_avg = 0x4,
    form = 0x8,
    last_games_avg_1 = 0xC
}

PLAYERMORALE_STRUCT = {
    size = 0x60,
    pid = 0x0,
    contract = 0x24,
    morale_val = 0x28,
    playtime = 0x30,
}

-- All available forms
FORMS = {
    MainWindowForm, SettingsForm, PlayersEditorForm
}



function get_components_description_manager_edit()
    return {
        BodyTypeEdit = {id = 3653, modifier = 1, db_col = "bodytypecode"},
        CommonNameEdit = {id = 3636, modifier = 0, db_col = "commonname"},
        EthnicityEdit = {id = 3638, modifier = 1, db_col = "ethnicity"},
        EyebrowcodeEdit = {id = 3642, modifier = 0, db_col = "eyebrowcode"}, 
        EyecolorcodeEdit = {id = 3643, modifier = 1, db_col = "eyecolorcode"},
        FaceposerpresetEdit = {id = 3640, modifier = 0, db_col = "faceposerpreset"},
        FacialhaircolorcodeEdit = {id = 3654, modifier = 0, db_col = "facialhaircolorcode"},
        FacialhairtypecodeEdit = {id = 3632, modifier = 0, db_col = "facialhairtypecode"},
        FirstnameEdit = {id = 3630, modifier = 0, db_col = "firstname"},
        GenderEdit = {id = 3635, modifier = 0, db_col = "gender"},
        HaircolorcodeEdit = {id = 3625, modifier = 0, db_col = "haircolorcode"},
        HairstylecodeEdit = {id = 3652, modifier = 0, db_col = "hairstylecode"},
        HairtypecodeEdit = {id = 3628, modifier = 0, db_col = "hairtypecode"},
        HashighqualityheadEdit = {id = 3634, modifier = 0, db_col = "hashighqualityhead"},
        HeadassetidEdit = {id = 3637, modifier = 0, db_col = "headassetid"},
        HeadclasscodeEdit = {id = 3645, modifier = 0, db_col = "headclasscode"},
        HeadtypecodeEdit = {id = 3629, modifier = 0, db_col = "headtypecode"},
        HeadvariationEdit = {id = 3649, modifier = 0, db_col = "headvariation"},
        HeightEdit = {id = 3631, modifier = 130, db_col = "height"},
        ManageridEdit = {id = 3627, modifier = 1, db_col = "managerid"},
        NationalityEdit = {id = 3646, modifier = 0, db_col = "nationality"},
        OutfitidEdit = {id = 3651, modifier = 0, db_col = "outfitid"},
        PersonalityidEdit = {id = 3644, modifier = 0, db_col = "personalityid"},
        SeasonaloutfitidEdit = {id = 3632, modifier = 0, db_col = "seasonaloutfitid"},
        SideburnscodeEdit = {id = 3647, modifier = 0, db_col = "sideburnscode"},
        SkintonecodeEdit = {id = 3650, modifier = 1, db_col = "skintonecode"},
        SkintypecodeEdit = {id = 3648, modifier = 0, db_col = "skintypecode"},
        SurnameEdit = {id = 3639, modifier = 0, db_col = "surname"},
        TeamidEdit = {id = 3641, modifier = 1, db_col = "teamid"},
        WeightEdit = {id = 3633, modifier = 30, db_col = "weight"}
    }
end
